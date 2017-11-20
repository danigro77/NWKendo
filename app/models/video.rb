class Video < ApplicationRecord
  validates_presence_of :url, :taken_on
end