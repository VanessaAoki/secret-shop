class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_and_belongs_to_many :categories
  
  has_many :votes, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :text, presence: true, length: { minimum: 5, maximum: 250 }
end
