class IndexController < ApplicationController
  def status
    #TODO: Set port
    # This enables plain text mode
    # /0/config/set?control_html_output=off
    @status = HTTParty.get(Rails.application.config.motion_api_base_path)
    @config_values = get_config

  end

  # this supports a key and a value
  def update_config
    # hier könnte man nur bestime Sachen erlauben
    #config/set?framerate=2
    url = Rails.application.config.motion_api_base_path + '0/config/set?' + params[:key] + '=' + params[:value]
    result = HTTParty.get(url)
    # Hi  er könnte man die Rückgabe noch anschauen und ggf ein Fehler schmeissen
    redirect_to '/'
  end

  private
  def get_config
    config = HTTParty.get( Rails.application.config.motion_api_base_path + '0/config/list')
    values = {}
    config.lines.each do |line|
      itemvalues = line.split(' = ')
      values[itemvalues[0]] = itemvalues[1][0..-2]
    end
    values
  end

end
