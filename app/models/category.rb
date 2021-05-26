class Category < ApplicationRecord
  has_and_belongs_to_many :articles

  scope :priority_order, -> { order(:priority) }
  
  validates :name, presence: true, length: { mininum: 2, maximum: 20 }
end