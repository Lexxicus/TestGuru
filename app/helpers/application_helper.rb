module ApplicationHelper
  def question_header(question)
    if question.new_record?
      "<h2>Create new question for  #{@test.title} test</h2>".html_safe
    else
      "<h2>Edit question for #{question.test.title} test</h2>".html_safe
    end
  end

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to "Автор: #{author}", "http://github.com/#{author}/#{repo}", target: '_blank'
  end
end
