class Musician < ActiveRecord::Base

  validates :email, :username, uniqueness: true, presence: true

  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :bands

end