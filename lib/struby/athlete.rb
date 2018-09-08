require 'struby/client'

module Struby
  class Athlete
    attr_reader :id, :username, :resource_state,
                :firstname, :lastname,
                :city, :state, :country,
                :sex, :premium, :summit,
                :created_at, :updated_at,
                :badge_type_id, :profile_medium,
                :profile, :friend, :follower,
                :email, :follower_count,
                :friend_count, :mutual_friend_count,
                :athlete_type, :date_preference, :measurement_preference,
                :clubs, :ftp, :weight, :bikes, :shoes,
                :original_params

    def initialize(params = nil)
      raise ArgumentError unless [Hash, String, NilClass].include?(params.class)

      if params.nil? || params.is_a?(String)
        params = Struby::Client.fetch_athlete(params)
      end
      params.each { |k, v| instance_variable_set("@#{k}", v) }
      @bikes = set_bike_instance
      @clubs = set_club_instance
    end

    def name
      firstname + lastname
    end

    def power_weight_ratio
      ftp.to_f / weight.to_f
    end

    private

    def set_club_instance
      if clubs.first.is_a?(Hash)
        @clubs = clubs.map { |params| Struby::Club.new(params) }
      else
        clubs
      end
    end

    def set_bike_instance
      if bikes.first.is_a?(Hash)
        @bikes = bikes.map { |params| Struby::Bike.new(params) }
      else
        bikes
      end
    end
  end
end
