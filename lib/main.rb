
require './file_logic'
require './prompts'
require './game_logic'

class Game
  include Prompts
  include LoadFiles
  include Logic

  def initialize
    greeting
  end
end

game = Game.new
