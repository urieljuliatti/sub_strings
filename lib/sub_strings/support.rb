# frozen_string_literal: true

# support methods module
module Support
  def prepare
    @phrase.split.map { |splitted| splitted.gsub(/[-,'?!]/, '').downcase }
  end

  def increment(item)
    if @result[item].nil?
      @result[item] = 1
    else
      @result[item] += 1
    end
  end

end
