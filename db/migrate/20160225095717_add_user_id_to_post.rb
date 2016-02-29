class AddUserIdToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :user, null: false, index: true
  end
end
