class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_authorization_check

rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
       # To redirect to root url if not authorised user
       # format.html { redirect_to main_app.root_url, notice: exception.message }
        # to redirect to same list page if not authorised user
        format.html { redirect_to list_path, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end
end


