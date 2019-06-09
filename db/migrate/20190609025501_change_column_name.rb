class ChangeColumnName < ActiveRecord::Migration[5.2]
  rename_column "events", "start-time", "start_time"
end
