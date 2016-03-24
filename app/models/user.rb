class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  USER_ROLES = {
    :admin => 0,
    :standard => 10,
    :premium => 20
  }

  # Instance Methods to Define different Users
  def set_as_admin
    self.role = USER_ROLES[:admin]
  end

  def set_as_standard
    self.role = USER_ROLES[:standard]
  end

  def set_as_premium
    self.role = USER_ROLES[:premium]
  end

  # User Role Authorization
  def can_edit?(wiki)
    true if owns?(wiki) || admin? or premium?
  end

  def can_destroy?(wiki)
    true if owns?(wiki) || admin?
  end

  # Helpers for Methods above
  def owns?(wiki)
    true if self.id == wiki.user_id
  end

  def admin?
    true if self.role_name == :admin
  end

  def premium?
    true if self.role_name == :premium
  end

  def standard?
    true if self.role_name == :standard
  end

  def role_name
    User.user_roles.key(self.role)
  end

  def self.user_roles
    USER_ROLES
  end
end
