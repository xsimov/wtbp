class Concert < ActiveRecord::Base
  belongs_to :band
  validates :date, :hour, :place, presence: true

  def parse_hour
    "#{self.hour.hour.to_s.rjust(2, '0')}:#{self.hour.min.to_s.rjust(2, '0')}h"
  end
end