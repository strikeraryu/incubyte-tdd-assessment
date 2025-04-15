# frozen_string_literal: true

# StringCalculator
class StringCalculator
  DEFAULT_DELIMITER = ','

  def self.add(input)
    raise ArgumentError unless input.is_a? String

    return 0 if input.nil? || input.empty?

    numbers = parse_numbers(input)

    numbers.inject(:+)
  end

  def self.parse_numbers(input)
    delimiter = DEFAULT_DELIMITER

    if input.start_with?('//')
      delimiter_line, numbers_string = input.split("\n", 2)
      delimiter = delimiter_line[2]
      input = numbers_string
    end

    input.split(/#{Regexp.escape(delimiter)}|\n/).map(&:to_i)
  end

  private_class_method :parse_numbers
end
