class Venue < ActiveRecord::Base
  has_many :events, dependent: :destroy
  belongs_to :user

end
