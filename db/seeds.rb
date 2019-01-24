require 'rest-client'
require 'json'

puts "Clean database"
puts "..."

Team.destroy_all
puts "Cleaned"

puts "Get all Teams from API"
puts "..."

url_teams = 'https://api.football-data.org/v2/competitions/2021/teams'
club_data_serialized = RestClient.get(url_teams, {'X-Auth-Token' => '0d0c0925a37f431ba7e3bc1feb2a0ef3' })
club_date = JSON.parse(club_data_serialized)

club_date["teams"].each do |team|
  Team.create(
    name: team["name"],
    crest:
      if team['crestUrl'] == nil
        'https://www.shareicon.net/data/2015/12/22/691473_security_512x512.png'
      else
        team['crestUrl']
      end
  )
end

#   team["shortName"]
#   team["website"]
#   team["clubColors"]
#   team["venue"]

puts "Done"
