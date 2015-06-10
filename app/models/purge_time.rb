class Purge_time
# Include nicht vergessen

#update purge time
def self.update(val)
  # in file herein schreiben
  # val ist der neue wert
  File.open('/home/pi/security-camera/ini.txt', 'w') { |file| file.write(val)}


end

#show purge value
def self.show
  # aus File heraus lesen
  file = File.open('/home/pi/security-camera/ini.txt')
  time = file.read

end


end
