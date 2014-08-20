class CreateTableMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :username
      t.string :email
    end
    add_index :musicians, :username
  end
end
