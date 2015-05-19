class Purge_time
# Include nicht vergessen

def self.update(val)
  val.day.to_formatted_s(:number)
  # in file herein schreiben
  # val ist der neue wert
end

def self.show
  # aus File heraus lesen
end

end
