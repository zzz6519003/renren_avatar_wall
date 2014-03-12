class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def change_location
		# render params[:user][:latitude].inspect
		a = params[:user][:latitude]
		b = params[:user][:longitude]
		current_user.latitude = a;
		current_user.longitude = b;
		current_user.save
	end
end