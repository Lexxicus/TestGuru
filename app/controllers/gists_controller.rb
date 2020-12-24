class GistsController < ApplicationController
  before_action :set_question

  def create
    client = GistQuestionService.new(@question)
    if client.success?
      gist = client.call
      save_gist_link_to_db(gist)
      redirect_to @test_passage
    else
      flash[:danger] = t('.failure')
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

  def set_question
    @test_passage = TestPassage.find(params[:test_passage_id])
    @question = @test_passage.current_question
  end
end
