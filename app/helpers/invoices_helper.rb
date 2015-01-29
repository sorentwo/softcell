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

  def invoice_number(invoice)
    if invoice.new_record?
      invoice.class.next_number
    else
      invoice.number
    end
  end
end
