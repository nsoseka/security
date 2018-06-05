class Citizen < ActiveRecord::Base
  has_many :convocations
  has_many :convictions 
  has_many :flags
  has_many :restrictions
  validates_presence_of :surname, :given_names, :father, :mother, :occupation, :address, :height,
                        :sex, :sp, :id_card_number, :date_issued, :expiry_date, :passport_url

  validates_uniqueness_of :id_card_number
end

# NON_VALIDATABLE_ATTRS = ["id", "created_at", "updated_at"]
# VALIDATABLE_ATTRS = Citizen.attribute_names.reject{|attr| NON_VALIDATABLE_ATTRS.include?(attr)}

