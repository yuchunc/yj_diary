class Post < ActiveRecord::Base
  belongs_to :member

  validates_presence_of :title
end
