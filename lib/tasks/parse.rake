namespace :parse do

  desc "parse transfermarkt"
  task :transfermarkt => :environment do
    Tournament.destroy_all
    Match.destroy_all
    Goal.destroy_all
    Match.destroy_all
    Team.destroy_all
    Season.destroy_all
    SeasonsTournament.destroy_all

    Season.create!(start_year: 2015, end_year: 2016)
    Season.create!(start_year: 2016, end_year: 2017)
    Season.create!(start_year: 2017, end_year: 2018)

    ::Transfermarkt::Tournaments::Parser.new.call

    Tournament.first(5).each do |tournament|
      Season.all.each do |season|
        seasons_tournament = SeasonsTournament.create!(season: season, tournament: tournament)
        ::Transfermarkt::SeasonsTournaments::Parser.new(seasons_tournament: seasons_tournament).call
      end
    end
  end

end
