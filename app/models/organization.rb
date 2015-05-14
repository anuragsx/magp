class Organization < ActiveRecord::Base
  has_one :contact

  validates :name, :phone, :address, :city, :state, :zip, presence: true
  validates :name, uniqueness: true

  def complete_address
    add = []
    add << address unless address.blank?
    add << city unless city.blank?
    add << state unless state.blank?
    add << zip unless zip.blank?
    add.join(", ") unless add.blank?
  end

end
