class AddUserToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :user , index: true
  end
end
