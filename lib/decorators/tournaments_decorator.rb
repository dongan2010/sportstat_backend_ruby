require 'roar/decorator'
require 'roar/json'

module Decorators
  class TournamentsDecorator < Roar::Decorator
    include Roar::JSON

    property :id
    property :name
    property :country_id
  end
end
