Team.destroy_all
Club.destroy_all
Player.destroy_all
Match.destroy_all
Goal.destroy_all
Country.destroy_all
SeasonsTournament.destroy_all
Tournament.destroy_all

country1 = Country.create!(name: "England", region: "Europe")
country2 = Country.create!(name: "Italy", region: "Europe")

tournament = Tournament.create!(country: country1)

season = Season.create!

seasons_tournament = SeasonsTournament.create!(season: season, tournament: tournament)

club = Club.create!

player1 = Player.create!
player2 = Player.create!
player3 = Player.create!

team1 = Team.create!(season: season, club: club, players: [player1, player2], season_tournaments: [seasons_tournament])
team2 = Team.create!(season: season, club: club, players: [player3])

match = Match.create!(home_team: team1, away_team: team2, seasons_tournament: seasons_tournament, players: [player1, player2]])

goal1 = Goal.create!(team: team1, match: match, player: player1)
goal2 = Goal.create!(team: team1, match: match, player: player1)
goal3 = Goal.create!(team: team1, match: match, player: player2)
goal4 = Goal.create!(team: team2, match: match, player: player3)
