class RegistrationsController < Devise::RegistrationsController


	def new
		super
	end

	def create
		#u= User.new(first_name: params[:user][:first_name],
		#	email: params[:user][:email], password: params[:user][:password],
		#	password_confirmation: params[:user][:password_confirmation])
		u = User.new(user_params)
		if u.save
			flash[:notice] = "User created successfully"
			redirect_to new_user_session_path
		else
			puts u.errors.messages
			flash[:error] = "User creation failed"
			redirect_to new_user_registration_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :first_name, :last_name, :user_name, :DOB, :address, :city, :country, :password, :password_confirmation, :user_type)
	end


end