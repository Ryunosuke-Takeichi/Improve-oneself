class ChangeCalendarsToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_table :calendars, :events
  end
end
