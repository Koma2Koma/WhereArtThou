class User < ActiveRecord::Base
  include Searchable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :artist, dependent: :destroy
  has_one :venue
  belongs_to :category
  accepts_nested_attributes_for :artist, reject_if: :all_blank
  accepts_nested_attributes_for :venue, reject_if: :all_blank

  acts_as_liker

  searchable_columns :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :photo, :styles => { :medium => "300x300>", :avatar => "150x150#", :thumb => "50x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment :photo,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..4.megabytes }
  do_not_validate_attachment_file_type :photo

  scope :search_by_artists, ->(query) { search(query).where(is_artist: true) }
  scope :search_by_users, ->(query) { search(query).where(is_artist: false) }

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.username = auth.info.name   # assuming the user model has a name
	    # user.image = auth.info.image # assuming the user model has an image
	  end
  end
  
end
