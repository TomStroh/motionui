json.array!(@settings) do |line|
  json.key line.key
  json.current_value line.current_value
  json.allowed_values  line.allowed_values
end
