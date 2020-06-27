class Place < ApplicationRecord
  geocoded_by :address
  validates :street, :number, :city, :state, :country, :district, presence: true
  after_validation :geocode

  has_many :reviews
  has_many :photos

  def full_street_address
    [street, number, zip_code, city, state, country].join(', ')
  end

  def address
    [number, street, city, state, country].compact.join(', ')
  end

  def formatted_address
    "#{street}, #{number} - #{zip_code} - #{city}, #{state} - #{country}"
  end

  def formatted_district
    "#{district}, #{city} - #{state}, #{country}"
  end

  def self.kinds
    ['Ponto Turístico', 'Restaurante', 'Hospedagem', 'Praça', 'Comércio', 'Bar', 'Cultura', 'Outro']
  end
end
