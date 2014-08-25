class Musician < ActiveRecord::Base

  validates :email, :username, uniqueness: true, presence: true

  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :bands


  def get_position(band_id)
    query = "SELECT position FROM bands_musicians WHERE musician_id = #{self.id} AND band_id = #{band_id}"
    got_position = ActiveRecord::Base.connection.select_values(query).first
    self.position = (got_position.nil?) ? "still undefined!" : got_position
  end

end