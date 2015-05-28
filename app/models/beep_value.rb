class Beep_value
# Include nicht vergessen

def self.update(val)
  # in file herein schreiben
  # val ist der neue wert
  File.open('/home/pi/security-camera/beep.txt', 'w') { |file| file.write(val)}


end

def self.show
  # aus File heraus lesen
  file = File.open('/home/pi/security-camera/beep.txt')
  time = file.read

end


end
