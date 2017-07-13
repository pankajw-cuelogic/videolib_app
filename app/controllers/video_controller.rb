class VideoController < ApplicationController
	before_action :set_post, only:[:show, :edit, :update]
	before_action :correct_user, except: [:index, :show]
  before_action :admin_user, only: :destroy

  def index
    @video = Video.paginate(page: params[:page], :per_page => 5)

    if params[:search]      
     @video = Video.paginate(page: params[:page], :per_page => 5).search(params[:search]).order("created_at DESC")    
   else
     @video = Video.paginate(page: params[:page], :per_page => 5).order("created_at DESC")    
   end

   @categories=Category.all
 end

 def show
  @video = Video.find(params[:id])

  respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  def edit
  end

  def update
  end

  def new		
   @video = Video.new
 end

 def create		
   @video = Video.new(video_params)
   if @video.save
    puts "in save success"

    redirect_to newvideo_path , notice: 'Video Successfully uploaded.'
  else
    flash.now[:error] = @video.errors.full_messages
    render action: 'new'
  end
end

# DELETE /users/1
  # DELETE /users/1.json
  def destroy
  	@video= Video.find(params[:id])
  	@video.destroy

  	respond_to do |format|
  		format.html { redirect_to videolist_path, notice: 'Video Successfully Deleted.' }
  		format.json { head :no_content }
  	end
  end

  private

  def video_params
  	params.required(:video).permit(:video_title, :category, :item_video, :composer, :is_available, :category_id, :search) 	
  end

  def correct_user
  	@user =  User.find(current_user.id)
  	redirect_to(root_path) unless current_user?(@user)    
  end

  def current_user?(user)
  	user = current_user
  end

  def signed_in_user
  	redirect_to new_user_session_path, notice: "Please sign in." unless signed_in?
  end

  def admin_user
    redirect_to  videolist_path, notice: "You are not autherised user to delete this video" unless current_user.admin?
  end

end
