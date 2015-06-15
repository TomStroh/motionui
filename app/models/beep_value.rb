class Beep_value
# Include nicht vergessen

#function for update beep_value
def self.update(val)
  # in file herein schreiben
  # val ist der neue wert
  File.open('/home/pi/motionui/security-camera/beep.txt', 'w') { |file| file.write(val)}
end

#show beep time value
def self.show
  # aus File heraus lesen
  file = File.open('/home/pi/motionui/security-camera/beep.txt')
  time = file.read

end


end
