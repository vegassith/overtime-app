class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company, :string
    add_column :users, :ssn, :integer
  end
end
