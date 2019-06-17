# Write your code here!
require "pry"
def game_hash
    hash = {
      :home => {
             :team_name => "Brooklyn Nets",
             :colors =>[ "Black", "White"
             ],
             :players => {
              "Alan Anderson" => {
                  :number => 0,
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1
                },
                "Reggie Evans" => {
                  :number => 30,
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
                },
                "Brook Lopez" => {
                  :number => 11,
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15
                },
                "Mason Plumlee" => {
                  :number => 1,
                  :shoe => 19,
                  :points => 26,
                  :rebounds => 11,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5
                },
                "Jason Terry" => {
                  :number => 31,
                  :shoe => 15,
                  :points => 19,
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1
                }
  
             }
  
  },
  
  :away => {
             :team_name => "Charlotte Hornets",
             :colors =>["Turquoise", "Purple"],
             :players => {
              "Jeff Adrien" => {
                  :number => 4,
                  :shoe => 18,
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2
                },
                "Bismack Biyombo" => {
                  :number => 0,
                  :shoe => 16,
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 22,
                  :blocks => 15,
                  :slam_dunks => 10
                },
                "DeSagna Diop" => {
                  :number => 2,
                  :shoe => 14,
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5
                },
                "Ben Gordon" => {
                  :number => 8,
                  :shoe => 15,
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0
                },
                "Kemba Walker" => {
                  :number => 33,
                  :shoe => 15,
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 7,
                  :blocks => 5,
                  :slam_dunks => 12
                }
                 
              }
  
          } 
  
  
  
  }
  end
  
  


# knows the number of points scored by each player

def num_points_scored(name)
    game_hash.each do |location, team_data|
       team_data[:players].each do |player_name, data|
          if player_name == name #check the name to match
             return data[:points]
          end
       end
    end

end

#knows the shoe size of each player

 def shoe_size(name)
    game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, data|
        if player_name == name
          return data[:shoe]
        end
      end
    end
    
  end

#knows the Brooklyn nets colors are black and white.

  def team_colors(name)
    game_hash.each do |location, team_data|
      if team_data[:team_name] == name
        return team_data[:colors]
      end
    end
  end

#return the team data

 def team_names
    game_hash.collect do |location, team_data|
      team_data[:team_name]
    end
  end 
  
#returns the player jersey numbers
  def player_numbers(name)
    array = []
     game_hash.each do |location, team_data|
      if team_data[:team_name] == name
        team_data[:players].each { |player_name, value|
          array << value[:number]}
        end
      end
      array

    end

   
# returns all stats for a given player

  def player_stats(name)
    game_hash.each do |location, team_data|
       team_data[:players].each do |player_name, value|
          if player_name == name
             return value
          end
       end
    end
 end

 # returns the number of rebounds of the player with the biggest shoe size.
 def big_shoe_rebounds
    shoe_size = 0
    rebound = 0
    game_hash.each do |location, team_data|
       team_data[:players].each do |player_name, value|
          if value[:shoe] > shoe_size
             shoe_size = value[:shoe]
             rebound = value[:rebounds]
          end
       end
    end
    rebound
 end
 
 #return the player with most points scored. 
 def most_points_scored
 most_point = 0
 player = nil
 game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, value|
       if value[:points] > most_point
          most_point = value[:points]
          player = player_name
       end
   end
 end
 player
end
  
#return the winning team.
def winning_team
    home_team = 0
    away_team = 0
    game_hash[:home][:players].each do |name, value|
      home_team += value[:points]
    end
    game_hash[:away][:players].each do |name, value|
      away_team += value[:points]
    end
    if home_team > away_team
        game_hash[:home][:team_name]
    elsif home_team < away_team
        game_hash[:away][:team_name]
    else
        "It's a tie!"
    end
  end

# return the player with the longest name. 
#   def player_with_longest_name
#     longest = 0
#     player_name = ""
#     game_hash.each do |location, team_data|
#       team_data[:players].each do |name, value|
#         if name.length > longest
#           player_name = name
#         end
#       end
#       return player_name
#     end

    def player_with_longest_name
        longest_name_length = 0 
        longest_name = ""
        game_hash.reduce({}) do |memo, (key, value)|
          a = game_hash[key]  
          a[:players].reduce({}) do |memo, (key, value)|
            if key.length > longest_name_length
              longest_name_length = key.length
              longest_name = key
            end
          end
        end
        return longest_name
      end
    
  

  
#return true if the player with the longest name had the most steals. 

  def long_name_steals_a_ton?
    name_with_steal = nil
    steal_number = 0
    game_hash.each do |location, team_data|
      team_data[:players].each do |name, value|
        if value[:steals] > steal_number
          steal_number = value[:steals]
          name_with_steal = name
        end
      end
    end
    name_with_steal == player_with_longest_name
  end