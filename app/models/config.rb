class Config
  require 'yaml'
  @@settings

  def self.get_config_objects
    values = self.get_config
    config_obj = []

    @@settings.each do |setting|
      line = Config_line.new
      line.key = setting[0]
      line.current_value = values[setting[0]]
      line.allowed_values = setting[1]['allowed']
      config_obj << line
    end
    config_obj
  end

  def self.get_config
    values = {}
    @@settings ||= YAML.load_file(Rails.root.join('config', 'allowed_settings.yml'))
    remote_config ||= HTTParty.get( Rails.application.config.motion_api_base_path + '0/config/list')

    remote_config.lines.each do |line|
      itemvalues = line.split(' = ')
      values[itemvalues[0]] = itemvalues[1][0..-2]
    end
    values
  end
end
