class Product < ApplicationRecord
  belongs_to :category
  has_many :product_feature
  mount_uploaders :images, ImageUploader
  serialize :images, JSON

  NUM_OF_PRODUCTS_HOMEPAGE = 8
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
  
  scope :latest, -> { order(created_at: :desc).limit(NUM_OF_PRODUCTS_HOMEPAGE) }

  def images=(files)
    appended = files.map do |file|
      uploader = _mounter(:images).blank_uploader
      uploader.cache! file
      uploader
    end
    super(images + appended)
  end
  
  class << self
    def male_product_colors(product)
      product.product_feature.for_male.uniq{|x| x.color}.pluck(:color)
    end
    
    def female_product_colors(product)
      product.product_feature.for_female.uniq{|x| x.color}.pluck(:color)
    end
    
    def male_product_sizes(product)
      product.product_feature.for_male.uniq{|x| x.size}.pluck(:size)
    end
    
    def female_product_sizes(product)
      product.product_feature.for_female.uniq{|x| x.size}.pluck(:size)
    end
  end
end
