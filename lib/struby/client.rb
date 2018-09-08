require 'strava/api/v3'

module Struby
  class Client
    class << self
      def client(token: Struby.token)
        @client ||= Strava::Api::V3::Client.new(access_token: token)
      end

      def fetch_athlete(athlete_id)
        if athlete_id.nil?
          client.retrieve_current_athlete
        else
          client.retrieve_another_athlete(athlete_id)
        end
      end
    end
  end
end
