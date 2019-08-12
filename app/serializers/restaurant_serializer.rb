class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :cuisine, :created_at

  has_many :reviews
end
