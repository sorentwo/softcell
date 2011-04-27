class Invoice < ActiveRecord::Base
  NET_PERIODS         = %w(15 30 60 90)
  BASE_INVOICE_NUMBER = 100

  belongs_to :client
  has_many :items

  validates :number,    presence: true
  validates :title,     presence: true
  validates :client_id, presence: true
  validates :net_id,    presence: true

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  def self.next_number
    self.last.nil? ? BASE_INVOICE_NUMBER : self.last.number.succ
  end
end
