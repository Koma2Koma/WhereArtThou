class Artist < ActiveRecord::Base

  extend FriendlyId
  friendly_id :username, use: [:slugged, :history, :finders]

  has_many :works, dependent: :destroy
  belongs_to :user

  def username
    user.present? ? user.username : nil
  end

end