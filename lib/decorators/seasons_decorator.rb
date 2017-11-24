require 'roar/decorator'
require 'roar/json'

module Decorators
  class SeasonsDecorator < Roar::Decorator
    include Roar::JSON

    property :id
    property :start_year
    property :end_year
  end
end
