class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps null: false
    end
  end
end
