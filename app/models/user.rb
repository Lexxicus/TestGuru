class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :my_tests, class_name: 'Test'

  validates :name, presence: true
  validates :email, presence: true,
                    uniquenness: true

  def all_tests(level)
    tests.where("level = ?", level)
  end
end
