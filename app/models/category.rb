class Category < ApplicationRecord
  has_many :resources

  enum for_type: { resource: 0 }
end
