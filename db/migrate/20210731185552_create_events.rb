class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :time
      t.string :location

      t.timestamps
    end
  end
end
