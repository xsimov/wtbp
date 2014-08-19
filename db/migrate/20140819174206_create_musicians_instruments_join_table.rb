class CreateMusiciansInstrumentsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :musicians, :instruments
  end
end
