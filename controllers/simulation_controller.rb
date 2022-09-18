require "./models/battle_ship"
require "./models/missile_target"
require "./models/battle_field"

class SimulationController
  def initialize
    read_game_data
    @player1_hits = 0
    @player2_hits = 0
  end

  def shot_all_missiles
    i = 0
    while i < @total_missile
      @player1_hits += 1 if @player2_field.launch_missile(@player1_target_positions[i])
      @player2_hits += 1 if @player1_field.launch_missile(@player2_target_positions[i])
      i += 1
    end
  end

  def export
    File.open(@output_file, "w") do |file|
      file.write("Player1\n\n")
      @player2_field.grid_export(file)
      file.write("\n\nPlayer2\n\n")
      @player2_field.grid_export(file)
      file.write("\n\n#{check_winner}")
    end
  end

  def check_winner
    if @player1_hits > @player2_hits
      "Player 1 wins.\n"
    elsif @player1_hits < @player2_hits
      "Player 2 wins.\n"
    else
      "It is a draw.\n"
    end
  end

  private

  def read_game_data
    @input_file = ARGV[0]
    @output_file = ARGV[1]
    input = []
    file = File.open(@input_file, "r")
    file.each_line { |line| input << line.strip }
    file.close

    @grid_size = input[0].to_i
    @ship_count = input[1].to_i
    @total_missile = input[4].to_i

    player1_ship_positions = input[2].split(":")[0..(@ship_count - 1)]
    player2_ship_positions = input[3].split(":")[0..(@ship_count - 1)]
    player1_target_positions = input[5].split(":")[0..(@total_missile - 1)]
    player2_target_positions = input[6].split(":")[0..(@total_missile - 1)]

    @player1_ship_positions = BattleShip.parse_positions(player1_ship_positions)
    @player2_ship_positions = BattleShip.parse_positions(player2_ship_positions)
    @player1_target_positions = MissileTarget.parse_positions(player1_target_positions)
    @player2_target_positions = MissileTarget.parse_positions(player2_target_positions)

    @player1_field = BattleField.new(@grid_size)
    @player1_field.insert_battle_ship(@player1_ship_positions)

    @player2_field = BattleField.new(@grid_size)
    @player2_field.insert_battle_ship(@player2_ship_positions)
  end
end
