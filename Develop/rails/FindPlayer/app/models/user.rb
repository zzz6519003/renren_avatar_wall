class User < ActiveRecord::Base
	  # You likely have this before callback set up for the token.
	  before_save :ensure_authentication_token

	  def ensure_authentication_token
	  	if authentication_token.blank?
	  		self.authentication_token = generate_authentication_token
	  	end
	  end

	  private

	  def generate_authentication_token
	  	loop do
	  		token = Devise.friendly_token
	  		break token unless User.where(authentication_token: token).first
	  	end
	  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
end
