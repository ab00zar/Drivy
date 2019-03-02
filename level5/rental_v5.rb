require_relative '../level4/rental_v4.rb'
class RentalV5 < RentalV4
  attr_reader :id, :distance, :car
  attr_accessor :options
  def initialize(args)
    @id = args["id"]
    @start_date = Date.parse(args["start_date"])
    @end_date = Date.parse(args["end_date"])
    @distance = args["distance"]
    @car = find_car(args["cars"], args["car_id"])
    @options = find_options(args["options"])
  end

  def find_car(cars, car_id)
    cars.find { |c| c.id == car_id  }
  end

  def find_options(opts)
    options = []
    opts.each do |opt|
      options << opt["type"] if opt["rental_id"] == self.id
    end
    options
  end

  def owner
    (general_owner_price + gps_price + baby_seat_price).round
  end

  def general_owner_price
    price * 0.7
  end

  def gps_price
    options.include?("gps") ? (duration * 500) : 0
  end

  def baby_seat_price
    options.include?("baby_seat") ? (duration * 200) : 0
  end

  def additional_insurance_price
    options.include?("additional_insurance") ? (duration * 1000) : 0
  end

  def drivy
    (additional_insurance_price + commission - (insurance + roadside_assistance)).round
  end

  def driver
    price + options_price
  end

  def options_price
    gps_price + baby_seat_price + additional_insurance_price
  end

end
