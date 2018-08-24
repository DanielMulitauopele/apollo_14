class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_spacemissions
  has_many :spacemissions, through: :astronaut_spacemissions

  def self.average_age
    (Astronaut.all.average(:age)).round(2)
  end
end
