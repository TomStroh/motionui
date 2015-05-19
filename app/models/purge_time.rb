class Purge_time
# Include nicht vergessen

def self.update(val)
  # in file herein schreiben
  # val ist der neue wert
  File.open("/tmp/ini.txt", "w") { |file| file.write(val)}


end

def self.show
  # aus File heraus lesen
  file = File.open("/tmp/ini.txt")
  time = file.read

end

end
