class AddSecondsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :seconds, :integer
  end
end
