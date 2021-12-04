# frozen_string_literal: true

# sub_strings starting point
class Start
  def initialize(word)
    @word = word
  end

  def generate
    hash = {}
    Support.dictionary.each do |w|
      hash[w] = + 1 if @word.include?(w)
    end
    hash
  end
end
