module ApplicationHelper
  def current_year
    " © #{Time.now.year} Copyright: "
  end

  def github_url(author, repo)
    link_to author.to_s, "http://github.com/#{author}/#{repo}", target: '_blank', class: 'text-dark'
  end

  def gist_hash(url)
    url.split('/').last
  end
end
