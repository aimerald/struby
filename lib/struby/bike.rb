module Struby
  class Bike
    attr_reader :id, :primary, :name, :resource_state, :distance
    def initialize(params)
      params.each { |k, v| instance_variable_set("@#{k}", v) }
    end
  end
end
