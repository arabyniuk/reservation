class Reservation < ActiveRecord::Base
  belongs_to :table
  validates :start_time, :end_time, presence: true

  validate :date_range, :date_overlap

  def date_range
    if self.start_time && self.end_time
      errors.add( :end_time, "Invalid date range") if self.start_time > self.end_time
    end
  end

  def date_overlap
    if self.new_record?
      overlap = Reservation.where("? < end_time AND ? > start_time AND ? = table_id", self.start_time, self.end_time, self.table_id)
    else
      overlap = Reservation.where("? < end_time AND ? > start_time AND ? = table_id AND id !=?", self.start_time, self.end_time, self.table_id, self.id)
    end

    if overlap.size > 0
      errors.add(:start_time, "")
      errors.add(:end_time, "Date range overlaps with these events")
    end
  end
end
