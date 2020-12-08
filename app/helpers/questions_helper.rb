module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "<h2>Create new question for  #{@test.title} test</h2>".html_safe
    else
      "<h2>Edit question for #{question.test.title} test</h2>".html_safe
    end
  end
end
