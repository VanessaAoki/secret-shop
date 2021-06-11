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

  def most_votes
    out = ''
    @popular.each do |vote|
      out += "<h1 class=\"is-size-5 has-text-weight-bold has-text-accent ml-2\">#{vote.article.title}</h1>"
      out += "<p class=\"has-text-weight-bold ml-2 articles-news-main\">#{vote.article.text}</p>"
    end
    out.html_safe
  end

  def most_votes_images
    out = ''
    @popular.each do |vote|
      out += image_tag vote.article.image, class: 'article-main-image'
    end
    out.html_safe
  end
end
