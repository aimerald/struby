require 'struby/version'
require 'struby/athlete'
require 'struby/bike'
require 'struby/club'
require 'struby/activity'
require 'struby/activities'

module Struby
  module_function

  def token(strava_token = nil)
    strava_token || ENV['STRAVA_TOKEN']
  end
end
