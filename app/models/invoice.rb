class Invoice < ActiveRecord::Base
  NET_PERIODS         = [15, 30, 60]
  BASE_INVOICE_NUMBER = 100

  belongs_to :client
  has_many :items

  validates :number,    presence: true
  validates :title,     presence: true
  validates :client_id, presence: true
  validates :net_id,    presence: true

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: lambda { |item| item[:name].blank? }

  scope :descending,  -> { order('number DESC') }
  scope :outstanding, -> { where(paid_at: nil) }
  scope :total,       -> { scoped.pluck(:total).sum }

  def self.next_number
    self.last.nil? ? BASE_INVOICE_NUMBER : self.maximum(:number).succ
  end

  def net
    NET_PERIODS[net_id.to_i]
  end

  def net=(value)
    self.net_id = NET_PERIODS.index(value.to_i)
  end

  def total
    items.map(&:cost).reduce(0, :+)
  end

  def due_at
    created_at.advance(days: self.net) if created_at.present?
  end

  def due?
    if due_at.present?
      due_at < Time.now
    else
      false
    end
  end
end
