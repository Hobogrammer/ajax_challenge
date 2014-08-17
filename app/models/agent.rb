class Agent < ActiveRecord::Base
  has_many :adspots
  accepts_nested_attributes_for :adspots
end
