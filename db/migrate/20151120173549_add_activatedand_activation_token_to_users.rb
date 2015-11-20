class AddActivatedandActivationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activated, :boolean, default: :true
    add_column :users, :activation_token, :string

    change_column :users, :activated, :boolean, default: false, null: false
    change_column :users, :activation_token, :string, null: false
  end
end
