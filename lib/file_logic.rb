require 'json'
require 'date'

# module containg file loading methods
module LoadFiles
  def load_dict
    @dict = File.readlines('../dictionary.txt', 'r').keep_if { |word| word.length.between?(5, 12) }
  end

  # def load_saves
  #   saves_file = File.open('../saves.txt').read
  #   @saves_hash = JSON.parse(saves_file, {symbolize_names: true})
  # end

  def save_and_quit
    new_save_hash = {
      "game_1_#{DateTime.now}": {
        'guesses_arr': @guesses_arr,
        'guesses_remaining': @guesses_remaining,
        'cur_word': @cur_word,
        'cur_guess_status': @cur_guess_status
      }
    }
    puts new_save_hash
  end
end
