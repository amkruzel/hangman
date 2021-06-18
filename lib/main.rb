
require './file_logic'
require './prompts'
require './game_logic'
require './player_input'

class Game
  include Prompts
  include LoadFiles
  include Logic
  include PlayerInput

  attr_reader :new_or_load, :dict

  def initialize
    greeting
    # from Prompts
    prompt_new_or_load_game

    # from PlayerInput
    new_or_load_game # assigns @new_or_load (1 - new, 2 - load)
  end

  def new_game
    load_dict
    game_init # inits @guesses arr and @guesses_remaining
    pick_word # defines @cur_word and @cur_guess_status
    game_rules
  end

  def play_round
    show_game(@guesses_remaining, @guesses)
    player_guess
    guess # assigns @cur_guess

    until check_guess?(@cur_guess, @cur_word, @cur_guess_status, @guesses)
      check_guess?(@cur_guess, @cur_word, @cur_guess_status, @guesses)
    end


  end

  def load_game

  end
end

game = Game.new

if game.new_or_load == '1'
  game.new_game
  game.play_round
end

game.play_round

game.play_round
