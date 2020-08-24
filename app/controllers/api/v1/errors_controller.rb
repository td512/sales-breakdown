class Api::V1::ErrorsController < ApplicationController
  include Gaffe::Errors

  layout false

  def show
    render "#{@rescue_response}.json.jbuilder", status: @status_code
  end
end
