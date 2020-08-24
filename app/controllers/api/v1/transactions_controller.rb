class Api::V1::TransactionsController < ApplicationController
  include StringUtils

  def index
    @year_information = Hash.new
    @start_date = Stat.order('transaction_date asc').first.transaction_date
    @end_date = Stat.order('transaction_date desc').first.transaction_date

    @start_date.strftime('%Y').upto(@end_date.strftime('%Y')).each do |year|
      @year_information[year] = Stat.all.where('CAST(transaction_date AS text) LIKE ?', "%#{year}%").count
    end
  end

  def show
    render 'api/v1/errors/not_acceptable.json.jbuilder', status: 406 unless char_count(params[:id]) > 3 &&
                                                                            is_number?(params[:id].tr(',-.', ''))
    @profits = {}
    @tax = {}
    @sales = {}
    @tx = {}
    @sales['current'], @sales['previous'], @tax['current'], @tax['previous'] = {}, {}, {}, {}
    @profits['current'],  @profits['previous'], @tx['current'],  @tx['previous'] = {}, {}, {}, {}

    begin
      @year = DateTime.parse(params[:id].tr(',', '-'))
    rescue ArgumentError
      # Do nothing, this is handled further down
    end
    
    begin
      @year.upto(@year + 1.year).each do |date|

        unless @sales['current'].key?(date.strftime('%Y-%m'))
          @sales['current'][date.strftime('%Y-%m')], @tax['current'][date.strftime('%Y-%m')], \
          @profits['current'][date.strftime('%Y-%m')], @tx['current'][date.strftime('%Y-%m')] = [0.0] * 4
        end

        Stat.all.where(transaction_date: date).each do |d|
          @sales['current'][date.strftime('%Y-%m')]  += d.transaction_exclusive
          @tax['current'][date.strftime('%Y-%m')]    += d.transaction_tax
          @profits['current'][date.strftime('%Y-%m')] += (d.transaction_exclusive + d.transaction_tax) - d.last_buy_price
          @tx['current'][date.strftime('%Y-%m')]     += d.transaction_quantity
        end
      end

      (@year - 1.year).upto(@year - 1.day).each do |date|

        unless @sales['previous'].key?(date.strftime('%Y-%m'))
          @sales['previous'][date.strftime('%Y-%m')], @tax['previous'][date.strftime('%Y-%m')], \
              @profits['previous'][date.strftime('%Y-%m')], @tx['previous'][date.strftime('%Y-%m')] = [0.0] * 4
        end

        Stat.all.where(transaction_date: date).each do |d|
          @sales['previous'][date.strftime('%Y-%m')]  += d.transaction_exclusive
          @tax['previous'][date.strftime('%Y-%m')]    += d.transaction_tax
          @profits['previous'][date.strftime('%Y-%m')] += (d.transaction_exclusive + d.transaction_tax) - d.last_buy_price
          @tx['previous'][date.strftime('%Y-%m')]     += d.transaction_quantity
        end
      end
    rescue NoMethodError
      render 'api/v1/errors/not_acceptable.json.jbuilder', status: 406
    end

    @sales.clone.each do |k, v|
      @sales[k] = v.reject {|k, v| v.nil? || v == 0.0}
    end
    @tax.clone.each do |k, v|
      @tax[k] = v.reject {|k, v| v.nil? || v == 0.0}
    end
    @profits.clone.each do |k, v|
      @profits[k] = v.reject {|k, v| v.nil? || v == 0.0}
    end
    @tx.clone.each do |k, v|
      @tx = @tx.except!(k)
      @tx[k] = v.reject {|k, v| v.nil? || v == 0.0}
    end

  end
end
