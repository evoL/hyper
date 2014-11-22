class Image < ActiveRecord::Base
  include Sluggable
  
  belongs_to :owner, class_name: 'User'

  mount_uploader :resource, ImageUploader
end
