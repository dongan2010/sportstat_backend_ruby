module Transfermarkt
  module SeasonsTournaments
    class MatchNode

      attr_accessor :source_node

      def initialize(source_node:)
        @source_node = source_node
      end

      def home_club_name
        home_club_name_node.text.gsub(/[\s,\t]+/, "").split("Position:")[0]
      end

      def away_club_name
        away_club_name_node.text.gsub(/[\s,\t]+/, "").split("Position:")[0]
      end

      def home_club_goal_nodes
        nodes = source_node.xpath("//div[@class='sb-ereignisse' and @id='sb-tore']//li[@class='sb-aktion-heim']")
        nodes.map { |node| Transfermarkt::SeasonsTournaments::GoalNode.new(source_node: node) }
      end

      def away_club_goal_nodes
        nodes = source_node.xpath("//div[@class='sb-ereignisse' and @id='sb-tore']//li[@class='sb-aktion-gast']")
        nodes.map { |node| Transfermarkt::SeasonsTournaments::GoalNode.new(source_node: node) }
      end

      private

      def home_club_name_node
        source_node.xpath("//div[contains(@class, 'sb-team') and contains(@class, 'sb-heim') and contains(@class, 'hide-for-small')]")
      end

      def away_club_name_node
        source_node.xpath("//div[contains(@class, 'sb-team') and contains(@class, 'sb-gast') and contains(@class, 'hide-for-small')]")
      end

    end
  end
end
