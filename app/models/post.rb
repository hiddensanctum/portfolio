class Post < ActiveRecord::Base
  attr_accessible :body, :comment, :title
end
