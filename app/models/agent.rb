class Agent < ActiveRecord::Base
  has_many :convocations
  has_many :convictions
  has_many :flags

  belongs_to :station
  
  has_one :citizen

  validates_uniqueness_of :id_card_number
  validates_presence_of :id_card_number, :service_id, :name, :station_id, :role
end
