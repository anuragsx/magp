class Contact < ActiveRecord::Base
  belongs_to :organization

  validates :name, :phone, :email, :address, :city, :state, :zip, presence: true
  validates :name, :email, uniqueness: true
  validate  :email_regex

  def email_regex
    if email.present? and not email.match(/\A[^@]+@[^@]+\z/)
      errors.add :email, "This is not a valid email format"
    end
  end

  def organization_name
    if !organization_id.blank?
      Organization.find(organization_id).name
    else
      " "
    end

  end

  def complete_address
    add = []
    add << address unless address.blank?
    add << city unless city.blank?
    add << state unless state.blank?
    add << zip unless zip.blank?
    add.join(", ") unless add.blank?
  end
end
