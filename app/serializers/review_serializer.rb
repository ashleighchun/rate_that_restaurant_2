class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating, :price, :title
  belongs_to :restaurant, serializer: RestaurantSerializer
end
