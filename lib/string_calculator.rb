# frozen_string_literal: true

# StringCalculator
class StringCalculator
  def self.add(input)
    raise ArgumentError unless input.is_a? String

    return 0 if input.nil? || input.empty?

    if input.start_with?('//')
      delimiter_line, numbers_string = input.split("\n", 2)
      custom_delimiter = delimiter_line[2]
      numbers = numbers_string.split(/#{Regexp.escape(custom_delimiter)}|\n/).map(&:to_i)
    else
      numbers = input.split(/[,\n]/).map(&:to_i)
    end

    numbers.inject(:+)
  end
end
