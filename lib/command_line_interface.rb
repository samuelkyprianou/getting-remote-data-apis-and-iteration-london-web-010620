def welcome
  puts "Welcome to the Star Wars information APP"
end

def get_character_from_user
  puts "please enter a character name"
  input = gets.chomp
  input.downcase
end
