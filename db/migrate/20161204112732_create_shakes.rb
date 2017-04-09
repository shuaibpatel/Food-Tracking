class CreateShakes < ActiveRecord::Migration
  def change
    create_table :shakes do |t|
      t.string :Name
      t.decimal :Cost
      t.decimal :Calories
      t.text :Description

      t.timestamps null: false
    end
  end
end
