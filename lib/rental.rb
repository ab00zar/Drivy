require 'Date'
class Rental
  attr_reader :id, :distance, :car
  def initialize(args)
    @id = args["id"]
    @start_date = Date.parse(args["start_date"])
    @end_date = Date.parse(args["end_date"])
    @distance = args["distance"]
    @car = args["cars"].find { |c| c.id == args["car_id"]  }
  end

  def price
    distance_price + daily_price
  end

  def distance_price
    car.price_per_km * distance
  end

  def daily_price
    car.price_per_day * duration
  end

  def duration
    (@end_date - @start_date).to_i + 1
  end
end
