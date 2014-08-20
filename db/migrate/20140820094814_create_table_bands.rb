class CreateTableBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :styles, array: true, default: []
      t.integer :year
    end
  end
end
