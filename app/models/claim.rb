class Claim < ApplicationRecord

  belongs_to :doctor
  belongs_to :patient
  belongs_to :event, :required => false

  has_one :pathological, :through => :patient, :source => :pathological
has_one :non_pathological, :through => :patient, :source => :non_pathological

end