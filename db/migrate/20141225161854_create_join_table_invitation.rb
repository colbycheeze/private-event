class CreateJoinTableInvitation < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.belongs_to    :event, index:true
      t.belongs_to    :user, index:true

      t.timestamps
    end
  end
end