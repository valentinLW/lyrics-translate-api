class Translation < ApplicationRecord
  belongs_to :song
  belongs_to :language
  has_many :lyrics

  after_validation(on: :create) do
    self.slug = "#{song.artist.name}-#{song.title}-#{language}-#{rand(36**4).to_s(36)}".parameterize
  end
end
