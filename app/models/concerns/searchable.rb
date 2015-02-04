module Searchable
  extend ActiveSupport::Concern

  COLUMNS_TO_SEARCH_VARIABLE = '@@columns_to_search'

  module ClassMethods
    
    def searchable_columns(*columns_to_search)
      class_variable_set COLUMNS_TO_SEARCH_VARIABLE, columns_to_search
    end

    def search(query_term)
      columns_to_search = class_variable_get(COLUMNS_TO_SEARCH_VARIABLE)

      query_string = columns_to_search.map {|column| "to_tsvector(#{column})" }.join(' || ')

      query_string = "( #{query_string} ) @@ plainto_tsquery(?)"

      where_conditions = [query_string, query_term]

      self.where(where_conditions)
    end
  end

end