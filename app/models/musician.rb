class Musician < ActiveRecord::Base

  validates :email, :username, uniqueness: true, presence: true

end