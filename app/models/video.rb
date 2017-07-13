class Video< ActiveRecord::Base
#belongs_to :users


def self.search(search)      
  #where("video_title LIKE ? ", "%#{search}%")       
#references(:category).      
#sort_by { |c| ActiveSupport::Inflector.transliterate(c.categoryname.text) }    

joins(:category).where('videos.video_title LIKE ? or categories.category_name LIKE ?', "%#{search}%", "%#{search}%") 

end

  has_attached_file :item_video,
  processors: lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }

# Validate the attached image is video/mp4, video/flv, etc
validates_attachment_content_type :item_video , :content_type => /\Avideo\/.*\Z/

belongs_to :category
belongs_to :user

validates :user_id, presence: true

end