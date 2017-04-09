class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :firstname
      t.string :lastname
      t.decimal :cost
      t.string :description

      t.timestamps null: false
    end
  end
end
