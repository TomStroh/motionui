class IndexController < ApplicationController

  #show status from motion and get livestream
  def index
    @status = HTTParty.get($motion_api_base_path)
    @live_stream_url = $motion_live_stream_path
    respond_to do |format|
      format.html
      format.json { render json: @status }
    end
  end


end
