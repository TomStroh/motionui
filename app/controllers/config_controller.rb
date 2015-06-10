class ConfigController < ApplicationController

  #lists all config options (logic in model Config)
  def index
    @settings = Config.get_config_objects
  end


  # this supports a key and a value update function
  #update config value
  def update_config

    url = $motion_api_base_path+ '0/config/set?' + params[:key] + '=' + params[:value]
    result = HTTParty.get(url)
    redirect_to :back
  end

end
