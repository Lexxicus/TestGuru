class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :test_by_category, lambda { |category|
    joins(:category)
      .where(categories: { title: category })
      .order(created_at: :desc)
      .pluck(:title, :level)
  }
end
