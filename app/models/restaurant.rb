class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews


  scope :search_by_rating, -> (search_rating){where("rating = ?", search_rating)}

  validates :name, :location, :cuisine, presence: true
  validates_uniqueness_of :name
end
