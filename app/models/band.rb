class Band < ActiveRecord::Base

  has_and_belongs_to_many :musicians
  has_many :concerts
  
  validates :name, :year, presence: true
  validates :name, uniqueness: true
  validate :year_is_not_future

  def members
    self.musicians
  end

  def get_members_with_position
    musicians = Musician.joins(:bands).where("bands_musicians.band_id = #{self.id}")
    musicians.each do |musician|
      query = "SELECT position FROM bands_musicians WHERE band_id = #{self.id} AND musician_id = #{musician.id}"
      current_musician_position = ActiveRecord::Base.connection.select_values(query).first
      musician.position = (current_musician_position.nil?) ? "still undefined!" : current_musician_position
    end
    musicians
  end

  def add_position(username, position)
    musician = Musician.find_by_username(username)
    query = "UPDATE bands_musicians SET position='#{position}' WHERE band_id = #{self.id} AND musician_id = #{musician.id}"
    ActiveRecord::Base.connection.execute(query)
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