module Transfermarkt
  module Tournaments
    class Parser < Transfermarkt::Parser

      include Transfermarkt::Helpers

      def call
        document = open_link_as_html(link: "#{base_url}/wettbewerbe/europa")
        tournaments_links = document.xpath("//table[@class='items']//td[@class='hauptlink']//a[not(descendant::img)]")

        tournaments_links.each do |tournament_link|
          puts 'parse ' + tournament_link

          splitted_link_to_tournament = tournament_link.attributes["href"].value.split("/")
          transfermarkt_tournament_name = splitted_link_to_tournament[1] #premier-legue
          transfermarkt_tournament_division_name = splitted_link_to_tournament[4] #GB1

          Tournament.find_or_create_by(transfermarkt_name: transfermarkt_tournament_name, transfermarkt_division_name: transfermarkt_tournament_division_name)
        end
      end

    end
  end
end
