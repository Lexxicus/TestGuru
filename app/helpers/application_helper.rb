module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to "Автор: #{author}", "http://github.com/#{author}/#{repo}", target: '_blank'
  end
end
