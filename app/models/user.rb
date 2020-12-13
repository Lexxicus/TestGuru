class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test'

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: EMAIL_REGEX,
                              message: 'Invalid email adress' }

  has_secure_password

  def all_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
