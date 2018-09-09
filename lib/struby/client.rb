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

      def fetch_gear(gear_id)
        client.retrieve_gear(gear_id)
      end

      def fetch_club(club_id)
        client.retrieve_a_club(club_id)
      end

      def fetch_activity(activity_id)
        @client.retrieve_an_activity(activity_id)
      end

      def fetch_activities(amount)
        @client.list_athlete_activities({ per_page: amount })
      end
    end
  end
end
