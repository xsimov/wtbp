class AddPositionToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :position, :string
  end
end
