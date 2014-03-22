class Api::V1::TokensController  < ApplicationController  

  skip_before_filter :verify_authenticity_token  
  respond_to :json  

  def create        
    email = params[:email]  
    password = params[:password]  

    if email.nil? or password.nil?  
     render :status=>400,:json=>{:message=>"Password&Username cannot be blank"}  
     return  
   end  

   @user=User.find_by_email(email.downcase)  
   
   if @user.nil?  
     render :status=>401, :json=>{:message=>"Invalid email or passoword."}  
     return  
   end  

   if not @user.valid_password?(password)  
     render :status=>401, :json=>{:message=>"Invalid email or password."}  
   else  
    @user.authentication_token = @user.authenticity_token
    render :status=>200, :json=> {:token=>@user.authentication_token}  
  end  
end  

end