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
    load_saves
    if check_for_saves
      new_or_load_init
    else
      @new_or_load = '1'
    end
  end

  def new_or_load_init
    # from Prompts
    prompt_new_or_load_game

    # from PlayerInput
    new_or_load_game # assigns @new_or_load (1 - new, 2 - load)
  end

  def new_game
    load_dict
    game_init # inits @guesses and @guesses_remaining
    pick_word # defines @cur_word and @cur_guess_status
    game_rules
  end

  def play_round
    show_game(@guesses_remaining, @guesses)
    player_guess
    guess # assigns @cur_guess

    until check_guess?(@cur_guess, @cur_word, @cur_guess_status, @guesses)
      @cur_guess.clear
      guess
    end
  end

  def game_loop
    loop do
      play_round
      prompt_save_game
      save_and_quit if save_game?
      break if game_over?
    end

    prompt_new_or_load_game
    new_or_load_game
  end

  def game_over?
    @cur_guess_status == @cur_word || @guesses_remaining.zero?
  end

  def load_game
    load_game_logic
  end
end

game = Game.new

# Game loop
loop do
  # New game
  if game.new_or_load == '1'
    loop do
      game.new_game

      game.game_loop

      break if game.new_or_load == '2'
    end
  end

  # Load game
  if game.new_or_load == '2'
    loop do
      game.load_game

      game.game_loop

      break if game.new_or_load == '1'
    end
  end
end
