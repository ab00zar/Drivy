require_relative '../lib/input.rb'
require_relative '../lib/car.rb'
require_relative '../lib/rental.rb'
require_relative '../lib/output.rb'

class Main
  attr_reader :path, :cars, :rentals, :results
  def initialize(path)
    @path = path
    @cars = []
    @rentals = []
    @results = []
  end

  def start
    load_objects
    compute_results
    generate_output
  end

  def load_objects
    input = Input.new(path)
    input.parsed_cars.each {|c| cars << Car.new(c)}
    input.parsed_rentals.each {|r| rentals << Rental.new(r.merge({"cars" => cars}))}
  end

  def compute_results
    rentals.each { |r| results.push({"id"=> r.id, "price" => r.price}) }
  end

  def generate_output
    output = Output.new(results).write
  end
end

Main.new("data/input.json").start
