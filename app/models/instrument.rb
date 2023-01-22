class Instrument < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true

  validates :title, :brand, :price, :model, presence: true
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum alowed. " }
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum alowed. " }
  # validates :price, numericality: { only_integer: true }, length: { maximum: 7 }

  BRAND = %w{ Fender Gibsom Epiphone ESP Martin }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }
end
