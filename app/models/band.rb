class Band < ActiveRecord::Base

  has_and_belongs_to_many :musicians
  validates :name, :year, presence: true
  validates :name, uniqueness: true
  validate :year_is_not_future


  private
  def year_is_not_future
    if year > Time.now.year
      errors.add(:year, "Year is in the future")
    end
  end
end