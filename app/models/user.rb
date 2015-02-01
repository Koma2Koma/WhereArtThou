class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :artist
  has_one :venue
  belongs_to :category
  accepts_nested_attributes_for :artist, reject_if: :all_blank
  accepts_nested_attributes_for :venue, reject_if: :all_blank

  acts_as_liker

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.username = auth.info.name   # assuming the user model has a name
	    # user.image = auth.info.image # assuming the user model has an image
	  end
  end

class User < ActiveRecord::Base
  # existing code

  
end

  

end
