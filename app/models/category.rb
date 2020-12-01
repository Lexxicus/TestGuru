class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :sorting, -> { order(created_at: :asc) }
end
