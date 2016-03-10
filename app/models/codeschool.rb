class Codeschool < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  mount_uploader :logo, LogoUploader
end
