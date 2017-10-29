class Image < ApplicationRecord
  belongs_to :photographer
  accepts_nested_attributes_for :photographer

  enum for_page: {
      home_landing: 0,
      schedule: 1
  }

  validates_presence_of :for_page, :url
end