class AddFieldsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :auth_expires_at, :datetime
  end
end
