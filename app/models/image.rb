class Image < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  mount_uploader :resource, ImageUploader

  def generate_slug!
    self.slug = SecureRandom.urlsafe_base64
  end
end
