require_relative '../lib/rental.rb'
class RentalV2 < Rental
  def daily_price
    price = 0
    for i in 1..self.duration
      case i
        when 1
          price += car.price_per_day
        when (2..4)
          price += car.price_per_day * 0.9
        when (5..10)
          price += car.price_per_day * 0.7
        else
          price += car.price_per_day * 0.5
      end
    end
    price.round
  end
end
