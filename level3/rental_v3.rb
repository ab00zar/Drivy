require_relative '../level2/rental_v2.rb'
class RentalV3 < RentalV2
  def commission
    price * 0.3
  end

  def insurance
    (commission * 0.5).round
  end

  def roadside_assistance
    duration * 100
  end

  def drivy
    (commission - (insurance + roadside_assistance)).round
  end
end
