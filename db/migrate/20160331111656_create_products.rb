class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, default: ""
      t.decimal :price, default: 0.0
      t.boolean :published, default: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
