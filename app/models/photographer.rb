class Photographer < ApplicationRecord
  has_many :images
  before_destroy :check_images

  def initials
    self.full_name.split(' ').map{|item| item[0].upcase}.join('')
  end

  private

  def check_images
    Images.where(photographer: self).each do |image|
      image.photographer = nil
      image.save
    end
  end

end