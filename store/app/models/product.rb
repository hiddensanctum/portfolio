class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_on
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
