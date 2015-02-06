class Event < ActiveRecord::Base
  include Searchable

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]

	belongs_to :venue
	has_many :artists

  searchable_columns :name, :city, :state, :start_date, :description

end
