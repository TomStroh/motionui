class ConfigController < ApplicationController

  def index
    @settings = Config.get_config_objects
  end


  # this supports a key and a value
  def update_config

    url = Rails.application.config.motion_api_base_path + '0/config/set?' + params[:key] + '=' + params[:value]
    result = HTTParty.get(url)
    # Hi  er könnte man die Rückgabe noch anschauen und ggf ein Fehler schmeissen
    redirect_to :back
  end

end
