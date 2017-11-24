require 'roar/decorator'
require 'roar/json'

module Decorators
  class GoalsDecorator < Roar::Decorator
    include Roar::JSON

    property :id
    property :minute
    property :team_id#, extend: TeamsDecorator, class: Team
  end
end
