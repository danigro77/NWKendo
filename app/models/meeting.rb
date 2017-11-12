class Meeting < ApplicationRecord
  include Filterable
  validates_presence_of :name, :start_time, :end_time

  scope :filter_name, -> (name) { where("name ilike ?", "%#{name}%")}
  scope :filter_location, -> (location) { where("location ilike ?", "%#{location}%")}
  scope :filter_start_date, -> (date) { where("start_time >= ?", date)}

  before_save :ensure_utc

  private
  def ensure_utc
    self.start_time = self.start_time.utc if self.start_time
    self.end_time = self.end_time.utc if self.end_time
  end


end