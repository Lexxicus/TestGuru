class Admin::BadgesController < ApplicationController
  before_action :find_badge, only: %i[edit update destroy show]
  before_action :set_images, only: %i[new edit update create]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, success: t('.success')
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    redirect_to request.referrer
  end

  private

  def set_images
    @images = Dir.glob('./app/assets/images/badges/**/*').select { |e| File.file? e }
    @images.map! { |image| image.split('/').last }
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :image_name, :condition, :condition_value)
  end
end
