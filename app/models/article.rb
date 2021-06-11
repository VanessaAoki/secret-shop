class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_and_belongs_to_many :categories

  has_many :votes, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :text, presence: true, length: { minimum: 5 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :most_popular, -> { find_by(votes_count: maximum(:votes_count)) }
end
