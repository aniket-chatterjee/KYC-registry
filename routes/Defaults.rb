class App < Roda
		use Rack::Session::Cookie, :secret => ENV['secret']
    plugin :indifferent_params
  	plugin :json
  	plugin :cookies
  	plugin :not_found
  	plugin :error_handler
  	plugin :placeholder_string_matchers
  	plugin :all_verbs
  	plugin :render, :engine=>'slim', :views=>'html'
  	plugin :static, ["/css", "/js", "/lib", "/images","/fonts"]
		not_found do
			# "Where did it go?"
			view 'error/404'
		end
    def self.indifferent_data(data)
      case data
      when Hash
        hash = Hash.new{|h, k| h[k.to_s] if Symbol === k}
        data.each{|k, v| hash[k] = indifferent_data(v)}
        hash
      when Array
        data.map{|x| indifferent_data(x)}
      else
        data
      end
    end
		error do |e|
			puts
			puts "========ERROR========"
	    LOGGER.error(e.message)
			puts e.message
			puts e.class
			puts
			e.backtrace.each_with_index do |x, i|
				if (i > 50)
					break
				else
          if i==0
            LOGGER.error("#{i} - #{x}")
          end
          puts("\t\t#{x}")
				end
			end
			puts

			{
	      :redirect=>false,
	  		:success => false,
				:error => e.message
			}.to_json
		end
end
