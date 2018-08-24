class SpaceMission < ApplicationRecord
  has_many :space_missions
  has_many :astronauts, through: :astronaut_spacemissions
end
