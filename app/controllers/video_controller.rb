class VideoController < ApplicationController
	#before_action :set_post, only:[:show, :edit, :update, :destroy]
	#before_action :authenticate_user, except: [:index, :show]

	def index
		@video = Video.all

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
		puts @video.item_video
		puts "Item temp path :"			

		redirect_to newvideo_path , notice: 'Video Successfully uploaded.'
	else		
		puts "render ERROR IN SAVE"	
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
  	params.required(:video).permit(:video_title, :category, :item_video, :composer, :is_available, :category_id) 	
  end

end
