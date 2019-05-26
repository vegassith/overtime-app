class AddWorkedPerformedToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :rationale, :worked_performed
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
