class UserController < ApplicationController
  load_and_authorize_resource :only => [:edit, :update, :show, :delete]
  before_action :signed_in_user
  before_action :correct_user, only:[:edit, :update, :delete]

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], :per_page => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
# GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def subscribe
    puts params[:id]
    @user = User.find(params[:id])
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # to show created user
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render json: @user, status: :created, location: @user }
        
        # to redirect ro list view
        format.html { redirect_to list_path, notice: 'User was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to list_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to list_path }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :DOB,
     :address, :city, :country, :password, :password_confirmation, :email, :user_type, :admin, :subscription_id)
  end

  def correct_user
    @user =  User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)    
  end

  def current_user?(user)
    user = current_user
  end

  def signed_in_user
    redirect_to new_user_session_path, notice: "Please sign in." unless signed_in?
  end
end
