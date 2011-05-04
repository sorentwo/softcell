module InvoicesHelper
  def format_date(datetime)
    datetime.strftime("%b %d, %Y")
  end

  def format_currency(value)
    number_to_currency(value, precision: 2)
  end

  def invoice_class(invoice)
    return 'paid' if invoice.paid_at.present?
    return 'due'  if invoice.due?
    nil
  end
end
