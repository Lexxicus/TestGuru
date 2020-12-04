class TestsController < ApplicationController
  before_action :tests, only:  %i[index]

  def index; end

  private

  def tests
    @tests = Test.all
  end
end
