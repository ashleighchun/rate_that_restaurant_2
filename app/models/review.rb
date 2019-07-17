class Review < ApplicationRecord
  validates :content, :rating, presence: true
  belongs_to :user
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}


  validates :restaurant, uniqueness: { scope: :user, message: "has already been reviewed by you"  }

end
