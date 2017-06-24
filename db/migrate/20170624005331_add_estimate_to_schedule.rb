class AddEstimateToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :estimate, :string
  end
end
