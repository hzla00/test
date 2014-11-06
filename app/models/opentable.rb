class Opentable 

	def initialize
	end

	def self.options location=nil
		location = "San Francisco" if !location
		location = location.gsub(' ', '%20')
		url = "http://opentable.herokuapp.com/api/restaurants?city=#{location}"
		places = HTTParty.get(url)["restaurants"]
		places
	end

	def self.image_for restaurant
		"http://www.opentable.com/img/restimages/#{restaurant["id"]}.jpg"
	end

	def self.reserve options=nil, event, choice, email
		base_url = 'http://hidden-bastion-8862.herokuapp.com/api/v1/opentable/reserve?'
		options = {restaurant_id: 105223, date_time: "11/13/2014 21:30:00", party_size: 2, first_name: "Robert", last_name: "Gustavez", email: "neohzla@gmail.com", phone_number: "4157760400"} if !options
		p options
		puts " \n" * 10
		options['date_time'] = URI.encode(options['date_time']).gsub('/','%2F').gsub(':','%3A')
		options_url = ''
		options.each do |k, v|
			options_url += "#{k.to_s}=#{v.to_s}&"
		end
		url = base_url + options_url
		response = HTTParty.get(url).parsed_response
		p response
		if response["success"] == "true"
			c_id = response["confirmation_id"]
			cancel(event.c_id) if event.c_id
			new_threshold = event.threshold + 1
			event.update_attributes confirmation_id: c_id.to_i, current_choice: choice.value, threshold: new_threshold
		else
			url =  JSON.parse(response['success'])["url"]
			binding.pry
			UserMailer.reservation_info(url, email).deliver
		end
		response
	end

	def self.cancel c_id
		url = "http://hidden-bastion-8862.herokuapp.com/api/v1/opentable/cancel?c_id=#{c_id}"
		HTTParty.get(url).parsed_response
	end


end
