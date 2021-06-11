class VotesController < ApplicationController
  def index
    @votes = Vote.all
    @popular = @votes.popular
  end

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      redirect_back fallback_location: '/', notice: 'You voted for an article.'
    else
      redirect_back fallback_location: '/', alert: 'There was a problem, please try again.'
    end
  end

  def destroy
    vote = Vote.find_by(user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_back fallback_location: '/', notice: 'You unvoted an article.'
    else
      redirect_back fallback_location: '/', alert: 'There was a problem, please try again.'
    end
  end
end
