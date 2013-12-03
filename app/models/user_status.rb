class UserStatus < ActiveRecord::Base
  belongs_to :user
  attr_accessible :status

  def check_user_status user
  	StatusLike.where(:user_id=>user.id, :user_status_id=>self.id)
  end
end
