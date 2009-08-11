class InitialSetup < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string   :name,     :null => false
      t.decimal  :price,    :null => false, :default => 0.00, :precision => 10, :scale => 2
      t.integer  :quantity, :null => false, :default => 0
      t.timestamps
    end
    add_index(:products, :name, :unique => true)

    create_table :orders do |t|
      t.string   :confirmation_code
      t.datetime :order_date
      t.timestamps
    end
    add_index(:orders, :confirmation_code, :unique => true)

    create_table :line_items do |t|
      t.integer :order_id,                  :null => false
      t.decimal :unit_price,                :null => false, :precision => 10, :scale => 2
      t.integer :quantity,                  :null => false
      t.integer :product_id,                :null => false
      t.timestamps
    end
    add_index(:line_items, :order_id)
    add_index(:line_items, :product_id)

    create_table :credit_card_payments do |t|
      t.integer :order_id,                  :null => false
      t.string :card_type,                  :null => false
      t.string :card_number,                :null => false
      t.string :expiration_month,           :null => false
      t.string :expiration_year,            :null => false
      t.timestamps
    end
    add_index(:credit_card_payments, :order_id, :unique => true)

    book = Physical::Product.create do |m|
        m.name = 'Enterprise Rails'
        m.price = 12.89
        m.quantity = 100
    end
  end

  def self.down
    drop_table :products
    drop_table :orders
    drop_table :line_items
    drop_table :credit_card_payments
  end
end

