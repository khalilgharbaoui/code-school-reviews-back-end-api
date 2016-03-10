class Codeschool < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  #mount_uploader :logo, LogoUploader
  mount_base64_uploader :logo, LogoUploader

  def average_rating
    # self.reviews.average(:rating).round if self.reviews.present?
    if reviews.present?
      reviews.average(:rating).round
    else
      return 0
    end
  end
end
