require_relative "../lib/docking_station"
require_relative "../lib/bike"


describe DockingStation do
  let (:bike) {Bike.new}
  let(:station) { DockingStation.new(:capacity => 20) }

	
	it "should accept a bike" do
		expect(station.bike_count).to eq(0)
		station.dock(bike)
		expect(station.bike_count).to eq(1)
  end

  it "should release a bike" do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it "should know when its full" do
    expect(station).not_to be_full
    20.times {station.dock(Bike.new)}
    expect(station).to be_full
  end

  it "should not accept a bike if it's full" do
    20.times{station.dock(Bike.new)}
    expect(lambda {station.dock(bike)}).to raise_error(RuntimeError)
  end

end