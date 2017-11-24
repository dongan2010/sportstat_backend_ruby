module Transfermarkt
  module SeasonsTournaments
    class Parser < Transfermarkt::Parser

      include Transfermarkt::Helpers

      attr_accessor :seasons_tournament

      def initialize(seasons_tournament:)
        @seasons_tournament = seasons_tournament
      end

      def call
        match_links.each do |match_link|
          begin
            puts "Parsing link #{match_link}"
            parse_match_link(match_link: match_link)
          rescue Net::OpenTimeout
            retry
          end
        end
      end

      private

      def parse_match_link(match_link:)
        match_node = ::Transfermarkt::SeasonsTournaments::MatchNode.new(source_node: open_link_as_html(link: match_link))

        home_club = ::Club.find_or_create_by(name: match_node.home_club_name)
        away_club = ::Club.find_or_create_by(name: match_node.away_club_name)

        home_team = ::Team.find_or_create_by(club: home_club, season: seasons_tournament.season)
        away_team = ::Team.find_or_create_by(club: away_club, season: seasons_tournament.season)

        home_team.seasons_tournaments << seasons_tournament if home_team.seasons_tournaments.exclude?(seasons_tournament)
        away_team.seasons_tournaments << seasons_tournament if away_team.seasons_tournaments.exclude?(seasons_tournament)

        goals = []
        match_node.home_club_goal_nodes.each do |goal_node|
          goals << ::Goal.create!(team: home_team, minute: goal_node.minute)
        end
        match_node.away_club_goal_nodes.each do |goal_node|
          goals << ::Goal.create!(team: away_team, minute: goal_node.minute)
        end

        ::Match.create!(home_team: home_team, away_team: away_team, goals: goals, seasons_tournament: seasons_tournament)
      end

      def match_links
        return @match_links if @match_links.present?

        year = seasons_tournament.season.start_year
        division_name = seasons_tournament.tournament.transfermarkt_division_name
        tournament_name = seasons_tournament.tournament.transfermarkt_name
        link = "#{base_url}/#{tournament_name}/gesamtspielplan/wettbewerb/#{division_name}/saison_id/#{year}"

        document = open_link_as_html(link: link)
        all_match_links = document.css(".ergebnis-link")

        @match_links = all_match_links.map do |match_link|
          base_url + match_link.attributes["href"].value
        end
      end

    end
  end
end
