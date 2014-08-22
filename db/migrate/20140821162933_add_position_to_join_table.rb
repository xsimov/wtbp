class AddPositionToJoinTable < ActiveRecord::Migration
  def change
    add_column :bands_musicians, :position, :string
  end
end
