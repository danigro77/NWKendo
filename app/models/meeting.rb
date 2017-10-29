class Meeting < ApplicationRecord
  validates_presence_of :name, :start_time, :end_time

  before_save :ensure_utc

  private
  def ensure_utc
    self.start_time = self.start_time.utc if self.start_time
    self.end_time = self.end_time.utc if self.end_time
  end
end