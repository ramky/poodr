class Gear
  attr_reader :chain_ring, :cog, :wheel

  def initialize(chain_ring, cog, wheel = nil)
    @chain_ring = chain_ring
    @cog        = cog
    @wheel      = wheel
  end

  def ratio
    chain_ring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference

puts Gear.new(52, 11, @wheel).gear_inches

puts Gear.new(52, 11).ratio

# >> 91.106186954104
# >> 137.0909090909091
# >> 4.7272727272727275
