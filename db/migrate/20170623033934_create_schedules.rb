class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :bustrain
      t.string :routeid
      t.timestamp :starttime
      t.timestamp :endtime
      t.string :days

      t.timestamps
    end
  end
end
