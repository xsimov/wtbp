class CreateJoinBandsMusicians < ActiveRecord::Migration
  def change
    create_join_table :bands, :musicians
  end
end
