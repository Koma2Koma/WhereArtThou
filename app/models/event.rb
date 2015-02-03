class Event < ActiveRecord::Base
  include Searchable

	belongs_to :venue
	has_many :artists

  searchable_columns :name, :city, :state, :start_date, :description

  # def self.event_search_doc(query)    
  #   where_conditions = [" (to_tsvector(name) ||
  #                       to_tsvector(city) ||
  #                       to_tsvector(state) ||
  #                       to_tsvector(start_date) ||
  #                       to_tsvector(description) ) @@ plainto_tsquery(?)", query]
  #   Event.where(where_conditions).all
  # end
end
