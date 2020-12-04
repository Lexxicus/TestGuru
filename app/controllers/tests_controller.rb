class TestsController < ApplicationController
  def index
    # render json: { tests: Test.all }
    # render file: 'public/about.html', layout: false
    # byebug

    respond_to do |format|
      format.html { render plain: 'All tests' }
      format.json { render json: { tests: Test.all } }
    end
  end
end
