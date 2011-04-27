class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :attention
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
    end

    remove_column :invoices, :address_1
    remove_column :invoices, :address_2
  end

  def self.down
    add_column :invoices, :string, :address_2
    add_column :invoices, :string, :address_1

    drop_table :clients
  end
end
