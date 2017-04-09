class CreateCustomersps < ActiveRecord::Migration
  def change
    create_table :customersps do |t|
      t.string :namesp
      t.string :surnamesp
      t.string :emailsp
      t.string :phonesp

      t.timestamps null: false
    end
  end
end
