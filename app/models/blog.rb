class Blog < ActiveRecord::Base
  attr_accessible :body, :title
  
  
  #association
  has_many :comments, as: :commentable
  
  validates :title, :presence =>true
  validates :body, :presence =>true
end
