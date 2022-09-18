class BattleField
  attr_accessor :grid, :grid_size

  def initialize(grid_size)
    @grid_size = grid_size
    @hits = 0
    @grid = Array.new(grid_size) { Array.new(grid_size, "_") }
  end

  def insert_battle_ship(ship_positions)
    ship_positions.each do |ship_position|
      @grid[ship_position.x][ship_position.y] = "B"
    end

    @grid
  end

  def launch_missile(target_position)
    if @grid[target_position.x][target_position.y] == "B"
      @grid[target_position.x][target_position.y] = "X"
      return true
    else
      @grid[target_position.x][target_position.y] = "O"
    end

    return false
  end

  def grid_export(file)
    self.grid.each do |row|
      line = row.join(" ")
      file.write(line + "\n")
    end
  end
end
