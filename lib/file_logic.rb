require 'json'
require 'date'

# module containg file loading methods
module LoadFiles
  def load_dict
    @dict = []
    contents = File.readlines('../dictionary.txt')
    contents.each do |line|
      line.gsub!("\r\n", '').downcase!
      @dict.push(line) if line.length.between?(5, 12)
    end
  end

  def load_saves
    saves_file = File.open('../saves.json').read
    @saves_hash = JSON.parse(saves_file)
  end

  def load_game_logic
    puts 'Which game would you like to load?'
    i = 1
    @saves_hash.each_pair do |key, value|
      puts "#{i}:"
      puts "\t#{key} // guesses: #{value['guesses']}"
      puts "\tguesses remaining: #{value['guesses_remaining']} // game state: #{value['cur_guess_status']}"

      i += 1
    end
    game_num = which_game_num(i)

    # get correct game
    j = 1
    @saves_hash.each_pair do |key, value|
      if j == game_num
        @guesses = value['guesses']
        @guesses_remaining = value['guesses_remaining']
        @cur_word = value['cur_word']
        @cur_guess_status = value['cur_guess_state']

        @saves_hash.delete(key)
      end
      j += 1
    end
  end

  def save_and_quit
    d = DateTime.now
    save_date = d.strftime('%F/%r')
    new_save_hash = {
      "#{prompt_save_game_name}#{save_date}": {
        'guesses': @guesses,
        'guesses_remaining': @guesses_remaining,
        'cur_word': @cur_word,
        'cur_guess_status': @cur_guess_status
      }
    }
    @saves_hash.merge!(new_save_hash)
    File.open('../saves.json', 'w') do |file|
      JSON.dump(@saves_hash, file)
    end
    puts 'Thanks for playing!'
    exit
  end
end
