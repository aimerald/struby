module Struby
  class Bike
    attr_reader :id, :primary, :name, :resource_state, :distance,
                :description, :brand_name, :frame_type

    def initialize(params)
      raise ArgumentError unless [Hash, String].include?(params.class)
      if params.is_a?(String)
        params = Struby::Client.fetch_gear(params)
      end
      params.each { |k, v| instance_variable_set("@#{k}", v) }
    end
  end
end
