require_relative "testing_library"

goal_message = "GOOOOOOOAL!!!!"
team_list = "Brazil, Mexico, Cameroon, Croatia, Netherlands, Chile, Australia, Spain, Germany, Ghana, US, Protugal"
long_string = <<-world_cup_news
  Clint, Dempsey, put, the, U.S.,
  ahead, in, the, first, minute,
  of, its, World, Cup, opener.
world_cup_news

# enter your solutions inside the methods
def goal(message)
  message * 2
end

def generate_an_array_of_teams(teams)
  teams.split(', ')
end

def number_of_teams(teams)
  teams.split.length
end

def return_australia(teams)
  split_teams = teams.split(', ')
  aus = split_teams.select{|x| x == "Australia"}
  aus.join
end

def starts_with_C(teams)
  split_teams = teams.split(', ')
  c_teams = split_teams.select{|x| x.include?("C")}
  c_teams
end

def block_string_to_single_line(block_string)
  one_line = block_string.gsub(/\n/ , '')
  one_line_no_comma = one_line.gsub(',', '')
  correct_spacing = one_line_no_comma.gsub('  ', ' ')
  one_more = correct_spacing.sub(' ', '')
  one_more
end

def capitalize_every_third_word(block_string)
  one_line = block_string.gsub!(/\n/, '')
  one_line_no_comma = one_line.gsub!(',', '')
  correct_spacing = one_line_no_comma.gsub!('  ', ' ')
  one_more = correct_spacing.sub!(' ', '')
  downcase = one_more.downcase.capitalize
  split = downcase.split
  cap = []
  split.each_with_index do |w, i |
    if i % 3 == 0
      cap.push(w.capitalize)
    else
      cap.push(w)
    end
  one_line = cap.join(" ")
  end
  one_line
end

check("goal method", goal(goal_message) == "GOOOOOOOAL!!!!GOOOOOOOAL!!!!")
check("generate_an_array_of_teams method",
      generate_an_array_of_teams(team_list) == ["Brazil", "Mexico", "Cameroon", "Croatia", "Netherlands", "Chile", "Australia", "Spain", "Germany", "Ghana", "US", "Protugal"] )
check("number_of_teams method", number_of_teams(team_list) == 12 )
check("return_australia method", return_australia(team_list) == 'Australia' )
check("starts_with_C method", starts_with_C(team_list) == ['Cameroon', 'Croatia', 'Chile'] )
check("block_string_to_single_line method",
      block_string_to_single_line(long_string) == "Clint Dempsey put the U.S. ahead in the first minute of its World Cup opener." )
check("capitalize_every_third_word method",
      capitalize_every_third_word(long_string) == "Clint dempsey put The u.s. ahead In the first Minute of its World cup opener." )

