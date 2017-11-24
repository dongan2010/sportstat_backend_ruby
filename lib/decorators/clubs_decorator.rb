require 'roar/decorator'
require 'roar/json'

module Decorators
  class ClubsDecorator < Roar::Decorator
    include Roar::JSON

    property :id
    property :name
  end
end
