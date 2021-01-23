class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = User.find(test_passage.user_id)
  end

  def call
    Badge.select do |badge|
      send("#{badge.condition}_check", badge)
    end
  end

  private

  def first_try_check(_badge)
    @test_passage.completed && TestPassage.where(test: @test, user: @user).count == 1
  end

  def by_category_check(badge)
    category = badge.condition_value
    return unless category == @test.category.title

    tests_ids = Test.test_by_category(@test.category.title).pluck(:id)
    user_passed_tests = TestPassage.where(user_id: @user, test_id: tests_ids, completed: 'true')
                                   .distinct.pluck(:test_id).count
    user_passed_tests == tests_ids.count
  end

  def by_level_check(badge)
    level = badge.condition_value.to_i
    return unless level == @test.level

    tests_ids = Test.where(level: @test.level).pluck(:id)
    user_passed_tests = TestPassage.where(user_id: @user, test_id: tests_ids, completed: 'true')
                                   .distinct.pluck(:test_id).count
    user_passed_tests == tests_ids.count
  end
end
