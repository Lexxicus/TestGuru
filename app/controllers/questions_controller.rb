class QuestionsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render plain: 'All questions' }
      format.json { render json: { tests: Question.where(test_id: 2) } }
    end
  end

  def show
    respond_to do |format|
      format.html { render plain: 'Question' }
      format.json { render json: { tests: Question.find(params[:id]) } }
    end
  end

  def new
    render plain: 'Create new question'
  end

  def destroy
    render plain: 'Question deleted'
  end
end
