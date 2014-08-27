class Musician < ActiveRecord::Base

  has_secure_password validations: false
  validates :password_digest, length: {minimum: 4}, on: :create
  validates :password_digest, confirmation: true

  validates :username, uniqueness: true, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true, uniqueness: true

  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :bands


  def get_position(band_id)
    query = "SELECT position FROM bands_musicians WHERE musician_id = #{self.id} AND band_id = #{band_id}"
    got_position = ActiveRecord::Base.connection.select_values(query).first
    self.position = (got_position.nil?) ? "still undefined!" : got_position
  end

end