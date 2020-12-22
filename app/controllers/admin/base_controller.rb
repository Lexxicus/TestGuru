class Admin::BaseController < ApplicationController
  before_action :admin_required!

  def admin_required!
    redirect_to root_path, danger: t('.message') unless current_user.admin?
  end
end
