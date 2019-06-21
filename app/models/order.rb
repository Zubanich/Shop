class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_many :line_items
  has_many :comments, dependent: :destroy

  enum status: {
  in_progress: 0,
  paid: 1
  }, _suffix: true
end
