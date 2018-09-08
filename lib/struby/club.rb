module Struby
  class Club
    attr_reader :id, :resource_state, :name, :profile_medium, :profile,
                :cover_photo, :cover_photo_small, :sport_type,
                :city, :state, :country, :private,
                :member_count, :featured, :verified,
                :url, :membership, :admin, :owner
    def initialize(params)
      params.each { |k, v| instance_variable_set("@#{k}", v) }
    end
  end
end
