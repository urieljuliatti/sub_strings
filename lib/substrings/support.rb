# frozen_string_literal: true

module Support

  def prepare
    @phrase.split.map { |splitted| splitted.gsub(/[-,'?!]/, '').downcase }
  end

  def append(item)
    if @result[item].nil?
      @result[item] = 1
    else
      @result[item] += 1
    end
  end

end
