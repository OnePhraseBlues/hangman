require 'oj'

module Serialization
  def self.save_state(object_state, file_name)
    Dir.mkdir('saves') unless Dir.exists?('saves')
    filename = "saves/#{file_name}.json"
    File.open(file_name, 'a') do |file|
      file.puts Oj.dump(object_state, :object)
    end
  end

  def load_state
    
  end
end

#Create file with Dir and File classes
#JSON object states with JSON class get written to file created
#Loading state algorithm work in progress