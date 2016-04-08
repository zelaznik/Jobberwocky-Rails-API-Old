class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :label

      t.timestamps
    end

    add_index :statuses, :label, unique: true
  end
end
