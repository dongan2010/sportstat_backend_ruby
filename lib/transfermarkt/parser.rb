require 'open-uri'

module Transfermarkt
  class Parser

    def open_link_as_html(link:)
      Nokogiri::HTML(open(link))
    end

  end
end
