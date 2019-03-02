require 'json'
class Input
  attr_reader :file
  def initialize(path)
    @file = JSON.parse(File.read(path))
  end

  def parsed_cars
    file['cars']
  end

  def parsed_rentals
    file['rentals']
  end
end
