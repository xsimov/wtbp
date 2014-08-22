class Band < ActiveRecord::Base

  has_and_belongs_to_many :musicians
  
  validates :name, :year, presence: true
  validates :name, uniqueness: true
  validate :year_is_not_future

  def members
    self.musicians
  end

  def musicians
    musicians = Musician.joins(:bands).where("bands_musicians.band_id = #{self.id}")
    musicians.each do |musician|
      query = "SELECT position FROM bands_musicians WHERE band_id = #{self.id} AND musician_id = #{musician.id}"
      musician.position = ActiveRecord::Base.connection.select_values(query).first
    end
    musicians
  end

  def parse_styles
    styles_str = ""
    self.styles.each do |style|
      styles_str += style + ", "
    end
    self.styles = styles_str[0..-3]
  end

  def add_a_member(username)
    new_member = Musician.find_by(username: username)
    self.members << new_member unless self.members.include? new_member
    self.save!
  end

  private

  def year_is_not_future
    if year > Time.now.year
      errors.add(:year, "Year is in the future")
    end
  end

end