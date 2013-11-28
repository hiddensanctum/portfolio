class Project < ActiveRecord::Base
  has_many :comments, as: :commentable
  attr_accessible :name, :technologies_used, :image, :remote_image_url, :description

  validates :technologies_used, presence:true
  validates :name, length: { in: 4..255 }
  mount_uploader :image, ImageUploader
end
