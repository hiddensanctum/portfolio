class Comment < ActiveRecord::Base
  attr_accessible :approved, :author, :author_email, :author_url, :content, :referrer, :user_agent, :user_ip
  scope :approved, where(approved: true)

  def approve!
    approved = true
    save!
  end

  validates :author, presence: true
  validates :author_email, presence: true
  validates :author_url, presence: true

  belongs_to :commentable, polymorphic: true
end
