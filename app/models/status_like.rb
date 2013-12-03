class StatusLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_status
  
  attr_accessible :user_id, :user_status_id
end
