
module Ganalytics
	class Gasite

		def initialize()
			@authorization = Analytics::Auth.new
			@client = AnalyticsReportingService.new
		  	@client.authorization = @authorization.auth
		end

		# View_id example Gojek ID 113427957
		# 
		def summary (view_id, options = nil)
			rr = ReportRequest.new
			rr.view_id = view_id
			# rr.filters_expression="ga:pagePath==/"
			rr.metrics = [set_metric(options)]
			rr.date_ranges = [set_date_range(options)]

			report(rr)
		end

		def dimensions(view_id, dimension = 'day',options = nil)
			rr = ReportRequest.new
			rr.view_id = view_id
			rr.metrics = [set_metric(options)]
			rr.date_ranges = [set_date_range(options)]

			dim = Dimension.new
			dim.name = "ga:#{dimension}"
			rr.dimensions = [dim]

			report(rr)
		end

		# Chart
		def chart_sum_json
			res = {:value => nil}
			r = @result
			res[:value] = r.reports[0].data.rows[0].metrics[0].values[0]
			p res
		end

		def chart_dim_json
			res = {:labels => [], :values => [], :count => nil, :total => nil, :max => nil, :min => nil}
			r = @result
			r.reports[0].data.rows.each do |q|
				res[:labels].push(q.dimensions[0])
				res[:values].push(q.metrics[0].values[0])
			end
			res[:count] = r.reports[0].data.row_count
			res[:total] = r.reports[0].data.totals[0].values[0]
			res[:max] = r.reports[0].data.maximums[0].values[0]
			res[:min] = r.reports[0].data.minimums[0].values[0]

			p res
		end

		private
		def report(rr)
			grr = GetReportsRequest.new
			grr.report_requests = [rr]
			@result = @client.batch_get_reports(grr)
		end

		def set_metric(options)
			metric = Metric.new
			metric.expression = !options.nil? ? (options["expression"].present? ? "ga:#{options['expression']}" : "ga:sessions") : "ga:sessions"
			p metric
		end

		def set_date_range(options)
			range = DateRange.new
			range.start_date = !options.nil? ? (options["start_date"].present? ? options["start_date"] : "7daysAgo") : "7daysAgo"
			range.end_date = !options.nil? ? (options["end_date"].present? ? options["end_date"] : "today") : "today"
			p range
		end
		
	end
end