class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  attr_accessible :body, :title

  def publish!
    published = true
    save!
  end

end
