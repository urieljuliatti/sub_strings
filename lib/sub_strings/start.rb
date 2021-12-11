# frozen_string_literal: true

# sub_strings starting point
class Start
  include Support

  def initialize(phrase, dictionary)
    @phrase = phrase
    @dictionary = dictionary
    @result = {}
  end

  def generate
    return if @phrase.empty?

    prepare.each do |prep|
      @dictionary.map do |item|
        increment(item) if prep.include?(item)
      end
    end
    @result
  end

  attr_accessor :phrase, :dictionary, :result
end
