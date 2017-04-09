class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|
      t.string :Food
      t.string :Day
      t.integer :Protein
      t.integer :Carbohydrates
      t.integer :Fats
      t.integer :Calories
      t.string :Country

      t.timestamps null: false
    end
  end
end
