class SampleNameChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column(:events, :time, :date)
  end
end
