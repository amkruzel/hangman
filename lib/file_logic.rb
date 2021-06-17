# module containg file loading methods
module LoadFiles
  def load_dict
    @@dict = File.readlines('dictionary.txt', 'r').keep_if { |word| word.length.between(5..12) }
  end
end
