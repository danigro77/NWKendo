class Question < ApplicationRecord
  acts_as_list scope: [:position]
  enum link_to_page: { home: 0, first_time_visit: 1 }
end