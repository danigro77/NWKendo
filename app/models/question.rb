class Question < ApplicationRecord
  acts_as_list scope: [:position]

end