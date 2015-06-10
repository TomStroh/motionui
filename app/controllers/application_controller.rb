class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


#Read ip from ip.txt
  file = File.open('/home/pi/security-camera/ip.txt')
  ip = file.read

#set variables for motion_api_base_path and motion_live_stream_path
  $motion_api_base_path = "http://"+ip+":8080/"
  $motion_live_stream_path = "http://"+ip+":8081"

end
