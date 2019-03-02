require_relative '../../lib/input.rb'
require_relative '../../lib/car.rb'
require_relative '../../lib/rental.rb'
require_relative '../../lib/output.rb'

describe Input do
  it 'test the number of cars' do
    i = Input.new("../data/input.json")
    expect(i.parsed_cars.length).to eq(3)
  end
end

describe Car do
  let(:car) { Car.new( "id"=>2, "price_per_day"=>3000, "price_per_km"=>15 ) }
  context 'to test variables' do
    it 'a simple test of price per km' do
      expect(car.price_per_km).to eq(15)
    end

    it 'test price per day' do
      expect(car.price_per_day).to eq(3000)
    end
  end
end

describe Rental do
  before(:all) do
    @cars = []
    @cars << Car.new( "id"=>1, "price_per_day"=>1500, "price_per_km"=>10 )
    @cars << Car.new( "id"=>3, "price_per_day"=>1000, "price_per_km"=>15 )
    @cars << Car.new( "id"=>4, "price_per_day"=>2000, "price_per_km"=>20 )
    @r = Rental.new({"id"=>1, "car_id"=>3, "start_date"=> "2017-12-8", "end_date"=> "2017-12-10", "distance"=> 10, "cars"=>@cars})
  end

  it 'check the car id' do
    expect(@r.car.id).to eq(3)
  end

  it 'test the duration' do
    expect(@r.duration).to eq(3)
  end

  it 'check the daily price' do
    expect(@r.daily_price).to eq(3000)
  end

  it 'test the distance price' do
    expect(@r.distance_price).to eq(150)
  end
end

describe Output do
  it 'check if the output and expected one are the same' do
    f1 = JSON.parse(File.read('../data/expected_output.json'))
    f2 = JSON.parse(File.read('../data/output.json'))

    expect(f1["rentals"]).to eq(f2["rentals"])
  end
end
