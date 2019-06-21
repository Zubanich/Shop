class Product < ApplicationRecord
  belongs_to :status
  validates :name, :price, presence: true
  scope :random, -> { order('random()') }

  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.
end
