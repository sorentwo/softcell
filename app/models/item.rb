class Item < ActiveRecord::Base
  belongs_to :invoice

  validates :name, presence: true
  validates :cost, presence: true, numericality: true
end
