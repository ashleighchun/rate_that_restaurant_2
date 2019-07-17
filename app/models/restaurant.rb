class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  scope :order_by_rating, -> {order(:rating)}

  scope :search_by_rating, -> (search_rating){where("rating = ?", search_rating)}
end
