class VoteController < ApplicationController
  before_action :find_article
  before_action :find_vote, only: [:destroy]

  def create
    if already_voted?
      redirect_to articles_path, notice: "You can't vote more than once."
    elsif @vote.save
      redirect_to articles_path, notice: 'You voted on this article.'
    else
      redirect_to articles_path, alert: 'You cannot vote on this article.'
    end
  end

  def destroy
    if already_voted?
      vote
      vote.destroy
      redirect_to articles_path, notice: 'You unvoted an article.'
    else
      redirect_to articles_path, alert: 'You cannot unvote an article that you did not vote before.'
    end
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def already_voted?
    Vote.where(user_id: current_user.id, article_id: params[article_id]).exists?
  end

  def find_vote
    @vote = @article.votes.find(params[:id])
  end
end
