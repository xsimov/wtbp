class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.date :date
      t.time :hour
      t.string :place
      t.text :additional_info
      t.integer :band_id
      
      t.timestamps
    end
  end
end
