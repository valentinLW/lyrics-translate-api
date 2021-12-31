class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :language

  after_validation(on: :create) do
    self.slug = "#{artist.name}-#{title}-#{rand(36**4).to_s(36)}".parameterize
  end
end
