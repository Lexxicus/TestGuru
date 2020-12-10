class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def all_tests(level)
    tests.where('level = ?', level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
