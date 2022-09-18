require "spec_helper"
require "./models/battle_field"

RSpec.describe BattleField do
  let(:battle_field) { described_class.new(1) }
  
  context "#grid_size" do
    it "should respond_to :grid_size" do
      expect(battle_field).to respond_to(:grid_size)
    end
    
    it "should return grid_size value" do
      expect(battle_field.grid_size).to eq(1)
    end
  end

  context "#grid_size" do  
    it "should respond_to :grid_size=" do
      expect(battle_field).to respond_to(:grid_size=)
    end

    it "should able to assign value to grid_size" do
      battle_field.grid_size = 2
      expect(battle_field.grid_size).to eq(2)
    end
  end
  
  context "#grid" do
    it "should respond_to :grid" do
      expect(battle_field).to respond_to(:grid)
    end

    it "should return grid_size value" do
      expect(battle_field.grid).to eq([["_"]])
    end
  end

  context "#grid=" do  
    it "should respond_to :grid=" do
      expect(battle_field).to respond_to(:grid=)
    end

    it "should able to assign value to grid" do
      new_grid = [["_", "_"], ["_", "_"]]
      battle_field.grid = new_grid
      expect(battle_field.grid).to eq(new_grid)
    end
  end
end