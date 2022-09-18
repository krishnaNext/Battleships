require "./controllers/simulation_controller"

simulation = SimulationController.new
simulation.shot_all_missiles
simulation.export
