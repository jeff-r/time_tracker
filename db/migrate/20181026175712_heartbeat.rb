class Heartbeat < ActiveRecord::Migration[5.2]
  def change
    create_table :heartbeats do |t|
      # t.string :type
      t.string :heartbeat_type

      t.timestamps
    end
  end
end
