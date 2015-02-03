module Searchable
  extend ActiveSupport::Concern

  MODEL_SEARCH_COLUMNS = {
    event: %w(name city state start_date description),
    user: %w(username),
    artist: %w(username),
    venue: %w(name city state),
    work: %w(title description medium)
  }

  def search(model, query)
    # build where_conditions
    where_conditions = []
    MODEL_SEARCH_COLUMNS[model.to_sym].length.times do
      where_conditions.push("(to_tsvector(?)")
    end
    where_condition = where_conditions.join(' || ').concat(" ) @@ plainto_tsquery(?)")
    col_string_and_query = MODEL_SEARCH_COLUMNS[model.to_sym].push(query).join(', ')
    where_conditions = [where_conditions, col_string_and_query]

    # execute search
    if model == 'user' || model == 'artist'

    else

    end
  end