module StringUtils
  def is_number? string
    true if Float(string) rescue false
  end

  def char_count string
    string.to_s.chars.count
  end
end