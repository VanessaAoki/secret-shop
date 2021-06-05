module VoteHelper
  def vote_button(art)
    if current_user
      vote = Vote.find_by(article: art, user: current_user)
      if vote
        button_to('Click to Unvote!', article_vote_path(id: vote.id, article_id: art.id), method: :delete,
                                                                                          class: 'button is-accent')
      else
        button_to('Click to Vote!', article_votes_path(article_id: art.id), method: :post, class: 'button is-accent')
      end
    else
      link_to('LOG IN to vote!', user_session_path)
    end
  end
end
