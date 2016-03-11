class Codeschool < ActiveRecord::Base
  has_many :reviews, dependent: :destroy


  def average_rating
    # self.reviews.average(:rating).round if self.reviews.present?
    if reviews.present?
      reviews.average(:rating).round
    else
      return 0
    end
  end
end
