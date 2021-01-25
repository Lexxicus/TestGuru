class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question
  before_save :test_successfull, if: :completed?

  PERCENT_TO_PASS = 85

  scope :by_level, ->(level) { joins(:test).where(tests: { level: level }) }
  scope :by_category, ->(category) { joins(:test).where(tests: { category: category }) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.completed = self.success?
    save!
  end

  def current_question_number
    test.questions.order(:id).ids.index(current_question.id) + 1
  end

  def total_question
    test.questions.count
  end

  def percent_of_correct_answers
    self.correct_questions / total_question.to_f * 100
  end

  def success?
    percent_of_correct_answers >= PERCENT_TO_PASS
  end

  def test_pass_percentage
    (current_question_number.to_f - 1) / total_question.to_f * 100
  end

  def time_is_over?
    return unless self.test.timer?

    Time.now >= timer_end
  end

  def time_left
    (created_at + test.timer * 60).to_i * 1000
  end

  def timer_end
    created_at + self.test.timer * 60
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def test_successfull
    self.completed = success?
  end
end
