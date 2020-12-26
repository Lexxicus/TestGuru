class Admin::GistsController < Admin::BaseController
  before_action :client, only: %i[destroy]
  def index
    @gists = Gist.all
  end

  def destroy
    gist = Gist.find(params[:id])
    @client.delete_gist(gist.git_id)
    gist.destroy
    redirect_to admin_gists_path, success: t('.success')
  end

  private

  def client
    @client = Octokit::Client.new(access_token: ENV['GIT_TOKEN'])
  end
end
