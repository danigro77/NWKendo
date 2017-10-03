class Photographer < ApplicationRecord
  has_many :images

  def initials
    self.full_name.split(' ').map{|item| item[0].upcase}.join('')
  end

end