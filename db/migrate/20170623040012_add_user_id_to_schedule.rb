class AddUserIdToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :user_id, :integer
  end
end
