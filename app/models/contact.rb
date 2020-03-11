class Contact < ApplicationRecord
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
end
