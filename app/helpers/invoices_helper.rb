module InvoicesHelper
  def format_date(datetime)
    datetime.strftime("%b %d, %Y")
  end
end
