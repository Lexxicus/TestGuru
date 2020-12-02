class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'level should be unique' }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :test_by_category, lambda { |category|
    joins(:category)
      .where(categories: { title: category })
      .order(created_at: :desc)
      .pluck(:title, :level)
  }
end
