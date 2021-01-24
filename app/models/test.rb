class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

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
  }

  def timer?
    timer.present?
  end
end
