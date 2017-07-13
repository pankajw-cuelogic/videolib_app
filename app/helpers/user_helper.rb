module UserHelper
	def subscribe
		@user = User.find(params[:id])
	end

	def current_user?(user)
		user = current_user
	end
end
