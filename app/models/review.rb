class Review < ApplicationRecord
  validates :content, :rating, presence: true
  belongs_to :user
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}


  validates :restaurant, uniqueness: { scope: :user, message: "has already been reviewed by you"  }


  #accepts nested attributes for :restaurant
  def restaurant_attributes=(attributes)
    restaurant = Restaurant.find_or_create_by(attributes)
    self.restaurant = restaurant if restaurant.valid? || !self.restaurant
  end

  scope :order_by_rating, -> {order(:rating)}

  #scope :search_by_rating, -> (search_rating){where("rating > ?", search_rating)}
end
