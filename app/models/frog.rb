class Frog < ActiveRecord::Base
  has_many :tadpoles
  belongs_to :pond
  validates :name, :color, :pond_id, presence: true
end