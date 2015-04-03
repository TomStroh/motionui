class FilesController < ApplicationController
  def index
    files = []
    Dir.foreach(get_video_path) {|x|
      files << x if x.last(4) == '.avi'
    }
    respond_to do |format|
      format.json { render json: files }
      format.html
    end
  end

  def get
    send_file get_video_path + params[:filename]
  end

  def delete

  end

  private
  def get_video_path
    Rails.application.config.video_path
  end

end