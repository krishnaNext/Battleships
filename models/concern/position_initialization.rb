module Concerns
  module PositionInitialization
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end

  module ClassMethods
    def parse_positions(positions)
      positions.map do |position|
        x, y = position.split(",").map { |s| s.strip.to_i }
        new(x, y)
      end
    end
  end
end
