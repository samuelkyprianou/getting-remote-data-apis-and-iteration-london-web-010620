require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  film_info = []
    response_hash['results'].each do |char|
      if char['name'].downcase == character_name
        char['films'].each do |url|
          r_string = RestClient.get(url)
          film_info << JSON.parse(r_string)
        end
      end
    end
    return film_info
end

# Luke Skywalker
def print_movies(films)
  films.each do |film|
    puts film
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
