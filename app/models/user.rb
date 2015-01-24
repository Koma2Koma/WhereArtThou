class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :artist
  has_one :venue
  belongs_to :category
  accepts_nested_attributes_for :artist
  accepts_nested_attributes_for :venue

  acts_as_liker

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.username = auth.info.name   # assuming the user model has a name
	    # user.image = auth.info.image # assuming the user model has an image
	  end
  end

  has_attached_file :image, :styles => { :avatar => "200x200>", :coverphoto => "925x340" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..4.megabytes },
    :file_name => { :matches => [/png\Z/, /jpe?g\Z/]}
  do_not_validate_attachment_file_type :image

end
