module Struby
  class Activity
    attr_reader :resource_state, :athlete,
                :name, :distance, :moving_time,
                :elapsed_time, :total_elevation_gain,
                :type, :id, :external_id, :upload_id, :start_date,
                :start_date_local, :timezone, :utc_offset, :start_latlng,
                :end_latlng, :location_city, :location_state,
                :location_country, :start_latitude, :start_longitude,
                :achievement_count, :kudos_count, :comment_count,
                :athlete_count, :photo_count, :map, :trainer, :commute,
                :manual, :private, :visibility, :flagged, :gear_id,
                :from_accepted_tag, :average_speed, :max_speed, :average_cadence,
                :average_watts, :weighted_average_watts,
                :kilojoules, :device_watts, :has_heartrate, :average_heartrate,
                :max_heartrate, :max_watts, :elev_high, :elev_low, :pr_count,
                :total_photo_count, :has_kudoed, :suffer_score

    def initialize(params)
      raise ArgumentError unless [Hash, String].include?(params.class)
      if params.is_a?(String)
        params = Struby::Client.fetch_activity(params)
      end
      params.each { |k, v| instance_variable_set("@#{k}", v) }
      @start_date = Time.parse(start_date)
      @start_date_local = Time.parse(start_date_local)
    end

    class << self
      def find(activity_id)
        new(Struby::Client.fetch_activity(activity_id))
      end

      def activities(amount)
        Struby::Activities.new(
          Struby::Client.fetch_activities(amount).map do |activity|
            Struby::Activity.new(activity)
          end
        )
      end
    end
  end
end
