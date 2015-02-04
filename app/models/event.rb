class Event < ActiveRecord::Base
  include Searchable

	belongs_to :venue
	has_many :artists

  searchable_columns :name, :city, :state, :start_date, :description

end
