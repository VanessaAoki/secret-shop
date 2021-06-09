class Category < ApplicationRecord
  has_and_belongs_to_many :articles

  validates :name, presence: true, length: { mininum: 2, maximum: 20 }

  def most_recent_article
    articles.most_recent.limit(2)
  end
end
