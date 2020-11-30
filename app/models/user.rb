class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  def all_tests(level)
    tests.where("level = ?", level)
  end
end
