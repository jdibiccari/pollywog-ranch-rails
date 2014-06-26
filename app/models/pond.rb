class Pond < ActiveRecord::Base
  has_many :frogs
  validates :name, presence: true
end