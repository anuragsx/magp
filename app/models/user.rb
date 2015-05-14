class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  #validates :email, presence: true

  has_and_belongs_to_many :roles

  #attr_accesible :role_ids

  before_save :setup_role

  def name
    if (!first_name.blank? && !last_name.blank?)
      first_name + " "  + last_name
    else
      ""
    end
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # Default role is "Admin"
  def setup_role
    if self.role_ids.empty?
      self.role_ids = [2]
    end
  end

end
