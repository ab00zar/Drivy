require 'json'
class Input
  attr_reader :file
  def initialize(path)
    @file = JSON.parse(File.read(path))
  end

  def parsed_objects(obj)
    file["#{obj}"]
  end

  #These two methods could be removed after refactoring (not used in level5)
  def parsed_cars
    file['cars']
  end

  def parsed_rentals
    file['rentals']
  end
end
