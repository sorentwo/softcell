module InvoicesHelper
  def format_date(datetime)
    datetime.strftime("%b %d, %Y")
  end

  def format_currency(value)
    number_to_currency(value, precision: 2)
  end
end
