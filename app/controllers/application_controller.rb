class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


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
