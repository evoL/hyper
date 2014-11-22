module Sluggable
  SLUG_LENGTH = 6

  def generate_slug!
    loop do
      self.slug = SecureRandom.urlsafe_base64[0...SLUG_LENGTH]

      break if self.class.where(slug: self.slug).empty?
    end
  end
end
