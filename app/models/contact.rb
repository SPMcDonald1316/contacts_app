class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: {with: /\A[a-zA-Z@.]+\z/}

  belongs_to :user
  
  def friendly_created_at
    created_at.strftime("%d.%m.%y")
  end

  def friendly_updated_at
    updated_at.strftime("%d.%m.%y")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def country_code
    phone_number.prepend("+81 ")
  end

  def email
    "#{first_name}#{last_name}@gmail.com"
  end

  def latitude
    results = Geocoder.search(address)  
    results.first.coordinates[0]
  end

  def longitude
    results = Geocoder.search(address)  
    results.first.coordinates[1]
  end
end
