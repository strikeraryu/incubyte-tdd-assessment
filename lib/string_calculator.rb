# frozen_string_literal: true

# StringCalculator
class StringCalculator
  DEFAULT_DELIMITER = ','

  def self.add(input)
    raise ArgumentError unless input.is_a? String

    return 0 if input.nil? || input.empty?

    numbers = parse_numbers(input).select { |number| number <= 1000 }
    negative_numbers = numbers.select(&:negative?)

    raise StandardError, "negatives not allowed: #{negative_numbers.join(', ')}" if negative_numbers.any?

    numbers.inject(:+)
  end

  def self.parse_numbers(input)
    delimiters = [DEFAULT_DELIMITER]

    if input.start_with?('//')
      delimiter_line, numbers_string = input.split("\n", 2)
      delimiters = delimiter_line.scan(/\[(.*?)\]/).flatten
      delimiters = delimiters.empty? ? [delimiter_line[2]] : delimiters

      input = numbers_string
    end

    delimiter_regex = delimiters.map { |d| Regexp.escape(d) }.join('|')
    input.split(/#{delimiter_regex}|\n/).map(&:to_i)
  end

  private_class_method :parse_numbers
end
