class UserList < ActiveRecord::Base
  attr_accessible :mapping_type, :mapping_id, :product_id

  belongs_to :mapping, :polymorphic => true
end
