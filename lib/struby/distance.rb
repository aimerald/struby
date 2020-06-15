module Struby
  class InvalidUnit < StandardError
  end
  class Distance
    MILE = 1.61
    attr_accessor :distance
    attr_reader :unit
    def initialize(distance)
      @distance = distance
    end

    def to_km(unit = :h)
      case unit
      when :h
        distance
      when :m
        distance / 60
      when :s
        distance / 3600
      else
        raise InvalidUnit
      end
    end

    def to_mile
      distance / MILE
    end
  end
end
