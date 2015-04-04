class IndexController < ApplicationController
  def index
    #TODO: Set port
    # This enables plain text mode
    # /0/config/set?control_html_output=off
    @status = HTTParty.get(Rails.application.config.motion_api_base_path)
    @live_stream_url = Rails.application.config.motion_live_stream_path
    respond_to do |format|
      format.html
      format.json { render json: @status }
    end
  end


end
