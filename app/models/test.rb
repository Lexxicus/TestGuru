class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  scope :test_by_category, lambda { |category|
    joins(:category)
      .where(categories: { title: category })
      .order(created_at: :desc)
      .pluck(:title, :level)
  }
end
