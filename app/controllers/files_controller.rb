class FilesController < ApplicationController
  def index
    @files = []
    Dir.foreach(get_video_path) {|x|
      @files << x if x.last(4) == '.mp4'
    }
    respond_to do |format|
      format.json { render json: @files }
      format.html
    end
  end

  def get
    send_file get_video_path + '/' + params[:filename] + '.mp4'
  end


  def delete
    #this uses HTTP DELETE, so be sure to use this in your links
    File.delete get_video_path + '/' + params[:filename] + '.mp4'
    redirect_to :back
  end

  private
  def get_video_path
    Rails.application.config.video_path
  end

end
