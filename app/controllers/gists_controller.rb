class GistsController < ApplicationController
  before_action :set_test_passage, :set_question
  before_action :find_gist, only: %i[create]

  def create
    if @gist
      flash[:success] = t('.gist_exist', git_url: @gist.html_url)
      redirect_to @test_passage
    else
      result = GistQuestionService.new(@question).call
      if result
        save_gist_link_to_db(result)
        redirect_to @test_passage
      else
        flash[:danger] = t('.failure')
      end
    end
  end

  private

  def save_gist_link_to_db(gist)
    @gist = current_user.gists.new(html_url: gist.html_url, git_id: gist.id, question_id: @question.id)

    if @gist.save
      flash[:success] = t('.gist_created', git_url: @gist.html_url)
    else
      flash[:danger] = t('.failure')
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def set_question
    @question = @test_passage.current_question
  end

  def find_gist
    @gist = Gist.find_by(user_id: current_user, question_id: @question)
  end
end
