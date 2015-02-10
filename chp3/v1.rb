class Gear
  attr_reader :chain_ring, :cog, :rim, :tire

  def initialize(chain_ring, cog, rim, tire)
    @chain_ring = chain_ring
    @cog        = cog
    @rim        = rim
    @tire       = tire
  end

  def ratio
    chain_ring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
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


puts Gear.new(52, 11, 26, 1.5).gear_inches  # => nil

puts Gear.new(52, 11, 26, 1.5).ratio
# >> 137.0909090909091
# >> 4.7272727272727275
