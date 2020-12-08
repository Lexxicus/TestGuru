class TestsController < ApplicationController
  before_action :find_test, %i[show edit destroy update]
  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :new
    end
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to request.referrer
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
  

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end
end
