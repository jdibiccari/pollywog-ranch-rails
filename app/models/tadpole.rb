class Tadpole < ActiveRecord::Base
  belongs_to :frog
  validates :name, :frog_id, presence: true
end