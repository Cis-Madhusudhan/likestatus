class Favourite < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many :products, :through => :user_lists
  has_many :user_lists, :as => :mapping
end
