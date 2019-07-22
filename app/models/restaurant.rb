class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :location, :cuisine, presence: true
  validates_uniqueness_of :name

  scope :order_by_name, -> {order(:name)}
end
