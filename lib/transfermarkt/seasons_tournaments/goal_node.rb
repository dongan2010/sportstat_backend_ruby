module Transfermarkt
  module SeasonsTournaments
    class GoalNode

      attr_accessor :source_node

      def initialize(source_node:)
        @source_node = source_node
      end

      def minute
        case img_position_str
        when "-0px -0px;"     then 1
        when "-36px -0px;"    then 2
        when "-72px -0px;"    then 3
        when "-108px -0px;"   then 4
        when "-144px -0px;"   then 5
        when "-180px -0px;"   then 6
        when "-216px -0px;"   then 7
        when "-252px -0px;"   then 8
        when "-288px -0px;"   then 9
        when "-324px -0px;"   then 10
        when "-0px -36px;"    then 11
        when "-36px -36px;"   then 12
        when "-72px -36px;"   then 13
        when "-108px -36px;"  then 14
        when "-144px -36px;"  then 15
        when "-180px -36px;"  then 16
        when "-216px -36px;"  then 17
        when "-252px -36px;"  then 18
        when "-288px -36px;"  then 19
        when "-324px -36px;"  then 20
        when "-0px -72px;"    then 21
        when "-36px -72px;"   then 22
        when "-72px -72px;"   then 23
        when "-108px -72px;"  then 24
        when "-144px -72px;"  then 25
        when "-180px -72px;"  then 26
        when "-216px -72px;"  then 27
        when "-252px -72px;"  then 28
        when "-288px -72px;"  then 29
        when "-324px -72px;"  then 30
        when "-0px -108px;"   then 31
        when "-36px -108px;"  then 32
        when "-72px -108px;"  then 33
        when "-108px -108px;" then 34
        when "-144px -108px;" then 35
        when "-180px -108px;" then 36
        when "-216px -108px;" then 37
        when "-252px -108px;" then 38
        when "-288px -108px;" then 39
        when "-324px -108px;" then 40
        when "-0px -144px;"   then 41
        when "-36px -144px;"  then 42
        when "-72px -144px;"  then 43
        when "-108px -144px;" then 44
        when "-144px -144px;" then 45
        when "-180px -144px;" then 46
        when "-216px -144px;" then 47
        when "-252px -144px;" then 48
        when "-288px -144px;" then 49
        when "-324px -144px;" then 50
        when "-0px -180px;"   then 51
        when "-36px -180px;"  then 52
        when "-72px -180px;"  then 53
        when "-108px -180px;" then 54
        when "-144px -180px;" then 55
        when "-180px -180px;" then 56
        when "-216px -180px;" then 57
        when "-252px -180px;" then 58
        when "-288px -180px;" then 59
        when "-324px -180px;" then 60
        when "-0px -216px;"   then 61
        when "-36px -216px;"  then 62
        when "-72px -216px;"  then 63
        when "-108px -216px;" then 64
        when "-144px -216px;" then 65
        when "-180px -216px;" then 66
        when "-216px -216px;" then 67
        when "-252px -216px;" then 68
        when "-288px -216px;" then 69
        when "-324px -216px;" then 70
        when "-0px -252px;"   then 71
        when "-36px -252px;"  then 72
        when "-72px -252px;"  then 73
        when "-108px -252px;" then 74
        when "-144px -252px;" then 75
        when "-180px -252px;" then 76
        when "-216px -252px;" then 77
        when "-252px -252px;" then 78
        when "-288px -252px;" then 79
        when "-324px -252px;" then 80
        when "-0px -288px;"   then 81
        when "-36px -288px;"  then 82
        when "-72px -288px;"  then 83
        when "-108px -288px;" then 84
        when "-144px -288px;" then 85
        when "-180px -288px;" then 86
        when "-216px -288px;" then 87
        when "-252px -288px;" then 88
        when "-288px -288px;" then 89
        when "-324px -288px;" then 90
        else
          raise img_position_str.inspect
        end
      end

      private

      def img_position_str
        @img_position_str ||= source_node.xpath(".//span[@class='sb-sprite-uhr-klein']")[0].attributes["style"].value.split("background-position: ")[1]
      end

    end
  end
end
