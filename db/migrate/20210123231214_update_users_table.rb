class UpdateUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string
    change_table :users do |t|
      t.rename :name, :first_name
      t.rename :password, :password_digest
    end
  end
end
