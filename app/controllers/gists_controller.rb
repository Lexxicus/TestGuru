class GistsController < ApplicationController
  before_action :set_question, only: %i[create]

  def create
    client = GistQuestionService.new(@question)
    result = client.call
    if client.success?
      save_gist_link_to_db(result)
    else
      flash[:danger] = t('.failure')
    end
    redirect_to @test_passage
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

  def set_question
    @test_passage = TestPassage.find(params[:test_passage_id])
    @question = @test_passage.current_question
  end
end
