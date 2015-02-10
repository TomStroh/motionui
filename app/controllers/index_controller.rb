class IndexController < ApplicationController
  def status
    #TODO: Set port
    @status = HTTParty.get(Rails.application.config.motion_api_base_path)
    @config_values = HTTParty.get( Rails.application.config.motion_api_base_path + '/0/config/list')
  end

  # this supports a key and a value
  def update_config
    # hier könnte man nur bestime Sachen erlauben
    url = Rails.application.config.motion_api_base_path + '/0/config/set?' + params[:key] + '=' + params[:value]
    result = HTTParty.get(url)
    # Hi  er könnte man die Rückgabe noch anschauen und ggf ein Fehler schmeissen
    redirect_to status
  end

end
