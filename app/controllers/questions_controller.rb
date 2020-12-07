class QuestionsController < ApplicationController
  before_action :test, only: %i[index create]
  before_action :question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show; end

  def new; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to :test_questions
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to request.referrer
  end

  private

  def test
    @test = Test.find(params[:test_id])
  end

  def question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
