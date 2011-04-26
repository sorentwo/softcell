class Invoice < ActiveRecord::Base
  BASE_INVOICE_NUMBER = 100

  validates :number, presence: true
  validates :title,  presence: true

  def self.next_number
    self.last.nil? ? BASE_INVOICE_NUMBER : self.last.number.succ
  end
end
