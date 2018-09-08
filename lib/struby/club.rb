module Struby
  class Club
    attr_reader :id, :resource_state, :name, :profile_medium, :profile,
                :cover_photo, :cover_photo_small, :sport_type,
                :city, :state, :country, :private,
                :member_count, :featured, :verified,
                :url, :membership, :admin, :owner,
                :admin, :following_count, :description, :club_type

    def initialize(params)
      raise ArgumentError unless [Hash, String].include?(params.class)
      if params.is_a?(String)
        params = Struby::Client.fetch_club(params)
      end
      params.each { |k, v| instance_variable_set("@#{k}", v) }
    end
  end
end
