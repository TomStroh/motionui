class ConfigController < ApplicationController

  def index
    require 'yaml'
    @settings = YAML.load_file(Rails.root.join('config', 'allowed_settings.yml'))
    @current_values = get_config
    respond_to do |format|
      format.html
      format.json { render json: @current_values }
    end

  end

  # this supports a key and a value
  def update_config
    # hier könnte man nur bestime Sachen erlauben
    #config/set?framerate=2
    url = Rails.application.config.motion_api_base_path + '0/config/set?' + params[:key] + '=' + params[:value]
    result = HTTParty.get(url)
    # Hi  er könnte man die Rückgabe noch anschauen und ggf ein Fehler schmeissen
    redirect_to :back
  end

end
