class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :login

  before_save :add_user_role
  after_create :create_list

  #associations
  has_many :user_statuses
  has_one :status_likes, :through => :user_statuses

  has_many :product_lists
  has_one :collection_list
  has_one :favourite

  attr_accessor :login
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def add_user_role
    self.add_role :user
  end

  def create_list
    self.build_collection_list.save
    self.build_favourite.save
  end

end
