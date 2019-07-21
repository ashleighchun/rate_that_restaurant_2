class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :ordered_reviews, -> {order_by_rating}, class_name: 'Review'

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(rating) desc')}
  scope :search_by_rating, -> (search_rating){where("rating = ?", search_rating)}

  validates_uniqueness_of :name
end
