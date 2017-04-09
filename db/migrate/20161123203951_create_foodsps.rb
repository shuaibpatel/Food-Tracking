class CreateFoodsps < ActiveRecord::Migration
  def change
    create_table :foodsps do |t|
      t.string :productsp
      t.string :pricesp
      t.string :expirysp
      t.string :caloriessp
      t.string :proteinssp
      t.string :sugarsp
      t.string :fatsp
      t.references :customersp, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
