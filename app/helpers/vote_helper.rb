module VoteHelper
  def vote_button(art)
    if current_user
      vote = Vote.find_by(article: art, user: current_user)
      if vote
        link_to('Click to Unvote!', article_vote_path(id: vote.id, article_id: art.id), method: :delete)
      else
        link_to('Click to Vote!', article_votes_path(article_id: art.id), method: :post)
      end
    else
      link_to('LOG IN to vote!', user_session_path)
    end
  end
end
