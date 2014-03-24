class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def change_location
		if params[:user]
			# render params[:user][:latitude].inspect
			a = params[:user][:latitude]
			b = params[:user][:longitude]
			current_user.latitude = a;
			current_user.longitude = b;
			# current_user.save
		end
	end

	def change_location_get
		
	end

	def find_player
		users = User.all
		minimum_distance = 99999
		nearest_user = current_user
		users.each { |e|
			distance = (e.latitude.to_i - current_user.latitude.to_i).abs + (e.longitude.to_i - current_user.longitude.to_i).abs
			if distance < minimum_distance and current_user != e
				minimum_distance = distance
				nearest_user = e
			end
		}
		render text:nearest_user.email
	end
end
