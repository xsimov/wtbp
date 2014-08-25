class AddOtherInfoToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :first_name, :string
    add_column :musicians, :last_name, :string
    add_column :musicians, :birth_date, :date
    add_column :musicians, :aliases, :string, array: true, default: []
  end
end
