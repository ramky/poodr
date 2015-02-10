class Gear
  attr_reader :chain_ring, :cog

  def initialize(chain_ring, cog)
    @chain_ring = chain_ring
    @cog        = cog
  end

  def gear_inches(diameter)
    ratio * diameter
  end

  def ratio
    chain_ring / cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire, :gear

  def initialize(rim, tire, chain_ring, cog)
    @rim   = rim
    @tire  = tire
    @gear  = Gear.new(chain_ring, cog)
  end

  def diameter
    rim + (tire * 2)
  end

  def gear_inches
    gear.gear_inches(diameter)
  end
end

puts Wheel.new(26, 1.5, 52, 11).gear_inches # => nil
# >> 137.0909090909091
