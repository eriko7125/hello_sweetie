module ApplicationHelper
  def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}円（税込）"
  end

  def converting_to_jpy_notax(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
end
