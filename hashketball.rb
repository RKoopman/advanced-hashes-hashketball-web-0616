# Write your code here!
require 'pry'

def game_hash
  {
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
            { :player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},        #closes AA stats-
            { :player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},       #closes RE stats-
            { :player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},      #closes BL stats-
            { :player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},       #closes MP stats-
            { :player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}        #closes JT stats-
        ]                                #closes :players
    },                                   #closes :home
    :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => [
            { :player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},        #closes JA stats-
            { :player_name => "Bismak Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},       #closes BB stats-
            { :player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},       #closes DD stats-
            { :player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},       #closes BG stats-
            { :player_name => "Brendan Haywood", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}        #closes BH stats-
        ]                                 #closes :players
    }                                    #closes :away
}                                        #closes new_hash
end

def players
  #list of players
  players = game_hash[:home][:players] + game_hash[:away][:players]
end

def player(name)
  #find a certain players
  player = players.find {|player| player[:player_name] == name}
end

def teams
  #list of teams
  both_teams = []
  teams = (both_teams.push(game_hash[:home])) + (both_teams.push(game_hash[:away]))
end

def team(team)
  #find home/away team
  team = teams.find {|team| team[game_hash] == name}
end

def num_points_scored(name)
  #given a  name, return the number of points
=begin
  players = game_hash[:home][:players] + game_hash[:away][:players]
  #give me a list of players, find the player information
  #given the player, find the number of points scores
  player = players.find {|player| player[:player_name] == name}
  player[:points]
=end
player = player(name)
player[:points]

end

def shoe_size(name)
  #give me a list of player

=begin
players = game_hash[:home][:players] + game_hash[:away][:players]
  #give me a list of players, find the player information
  #given the player, find the number of points scores
  player = players.find {|player| player[:player_name] == name}
  player[:shoe]
=end
  player = player(name)
  player[:shoe]
end


def team_colors(giventeam)
  #return the array of colors for a given team
  # 1) Iterate through game_hash to find the correct team name.
  # 2) Look for a key name :colors within that same hash.
  # 3) Return the value of that specific key.
  teams = game_hash
    teams.each do |side, player_name|
      # binding.pry
    if teams[side][:team_name] == giventeam
      # binding.pry
     return teams[side][:colors]
    end
  end
end

def team_names
  both_teams = []
  teams = (both_teams.push(game_hash[:home][:team_name])) + (both_teams.push(game_hash[:away][:team_name]))
  # binding.pry
  both_teams
end

def player_numbers(giventeam)
  players_array = []
  teams = game_hash
    teams.each do |side, team_info|
      # binding.pry
    if teams[side][:team_name] == giventeam
      # binding.pry
      teams[side][:players].each do |player|
        # binding.pry
        players_array.push(player.fetch(:number))
      end
      # binding.pry
    end
  end
  players_array
end
#
# def player_stats(givenplayer)
#   teams.each do |side, team_info|
#     binding.pry
#     team_info[:players].each do |player, stats|
#       # binding.pry
#       if player == givenplayer
#         reutrn stats
#       end
#     end
#   end
# end

def player_stats(givenplayer)
  find_the_player(givenplayer).reject { |key, value| key == :player_name }
end

def find_the_player(name)
  players.find {|player| player.fetch(:player_name) == name}
end

def big_shoe_rebounds
  player = players.sort_by {|player| player.fetch(:shoe) }.last
  # binding.pry
  player.fetch(:rebounds)
end
