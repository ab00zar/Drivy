require_relative '../lib/input.rb'
require_relative '../lib/car.rb'
require_relative '../lib/rental.rb'
require_relative '../lib/output.rb'
require_relative 'rental_v5'

class Main
  attr_reader :input, :cars, :rentals, :results
  def initialize(path)
    @input = Input.new(path)
    @cars = []
    @rentals = []
    @results = []
  end

  def start
    load_cars
    load_rentals
    compute_results
    generate_output
  end

  def load_cars
    input.parsed_objects('cars').each {|c| cars << Car.new(c)}
  end

  def load_rentals
    input.parsed_objects('rentals').each {|r| rentals << RentalV5.new(r.merge({"cars" => cars,
                                                                    "options"=> input.file['options']}))}
  end

  def compute_results
     rentals.each { |r| results.push(
      {
        "id"=> r.id,
        "options" => r.options,
        "actions" => [
          {"who" => "driver", "type" => "debit", "amount" => r.driver},
          {"who" => "owner", "type" => "credit", "amount" => r.owner},
          {"who" => "insurance", "type" => "credit", "amount" => r.insurance},
          {"who" => "assistance", "type" => "credit", "amount" => r.roadside_assistance},
          {"who" => "drivy", "type" => "credit", "amount" => r.drivy}
        ]
      })
    }
  end

  def generate_output
    output = Output.new(results).write
  end
end

Main.new("data/input.json").start
