class Product < ApplicationRecord
  belongs_to :category
  has_many :product_feature
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  has_many :ratings
  
  attr_accessor :delete_images
  after_validation do
    uploaders = images.delete_if do |uploader|
      if Array(delete_images).include?(uploader.file.identifier)
        uploader.remove!
        true
      end
    end
    write_attribute(:images, uploaders.map { |uploader| uploader.file.identifier })
  end

  def images=(files)
    appended = files.map do |file|
      uploader = _mounter(:images).blank_uploader
      uploader.cache! file
      uploader
    end
    super(images + appended)
  end
  
  def get_average_rating
    return self.ratings.average(:rate)
  end
end
