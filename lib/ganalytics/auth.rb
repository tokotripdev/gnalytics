require 'google/apis/analyticsreporting_v4'
require 'googleauth'

include Google::Apis::AnalyticsreportingV4
include Google::Auth

module Ganalytics
	class Auth
		
		def initialize
			auth
		end

		def auth
			
			json_key = File.open("#{Rails.root}/GojekClientApi-88343b29ffdb.json")
			scope = ["https://www.googleapis.com/auth/analytics.readonly"]
		  	ServiceAccountCredentials.make_creds({:json_key_io => json_key,:scope => scope})
		end

	end
end