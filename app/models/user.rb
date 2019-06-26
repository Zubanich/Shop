# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :comments, dependent: :destroy

  def active_orders_count
    orders.where(status: :in_progress).last&.line_items&.count
  end
end
