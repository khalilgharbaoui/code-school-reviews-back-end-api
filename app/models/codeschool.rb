class Codeschool < ActiveRecord::Base
  has_many :reviews
  mount_uploader :logo, LogoUploader
end
