class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.belongs_to :invoice
      t.string     :name
      t.decimal    :cost,     precision: 8, scale: 2, default: 0
      t.integer    :position, default: 0
    end
  end

  def self.down
    drop_table :items
  end
end
