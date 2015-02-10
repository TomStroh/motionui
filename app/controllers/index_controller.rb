class IndexController < ApplicationController
  def status
    #TODO: Set port
    @status = 'status'#HTTParty.get('http://heise.de')
    @config_values = 'values'#HTTParty.get( 'http:/localhost:port/0/config/list')
  end

  # this supports a key and a value
  def update_config
    # hier könnte man nur bestime  Sachen erlauben
    url = 'http://localhost:port/0/config/set?' + params[:key] + '=' + params[:value]
    result = HTTParty.get(url)
    # HIer könnte man die Rückgabe noch anschauen und ggf ein Fehler schmeissen
    redirect_to status
  end

end
