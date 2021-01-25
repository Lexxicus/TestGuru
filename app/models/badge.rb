class Badge < ApplicationRecord
  enum conditions: { no_rule: 0, by_category: 1, first_try: 2, by_level: 3 }

  validates :name, presence: true
  validates :image_name, presence: true
  validates :condition, presence: true
  validates :condition_value, presence: true

  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users
end
