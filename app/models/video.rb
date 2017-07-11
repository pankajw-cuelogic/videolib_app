class Video< ActiveRecord::Base
#belongs_to :users

# This method associates the attribute ":item_video" with a file attachment
  # has_attached_file :item_video, styles: {
  #   thumb: '100x100>',
  #   square: '200x200',
  #   medium: '300x300>',
  #   large: '600x600'
  # }
  has_attached_file :item_video,
  #  styles: lambda { |a| a.instance.is_image? ? {:small => "x200>", :medium => "x300>", :large => "x400>"}  : {:thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10}, :medium => { :geometry => "300x300#", :format => 'jpg', :time => 10}}},
    processors: lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }
# Validate the attached image is video/mp4, video/flv, etc
  validates_attachment_content_type :item_video , :content_type => /\Avideo\/.*\Z/

belongs_to :category
end