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
    if input.start_with?('//')
      delimiter_line, numbers_string = input.split("\n", 2)
      delimiters = delimiter_line.scan(/\[(.*?)\]/).flatten
      delimiters = delimiters.empty? ? [delimiter_line[2]] : delimiters

      input = numbers_string
    end

    input.split(/#{delimiter_regex(delimiters)}|\n/).map(&:to_i)
  end

  def self.delimiter_regex(delimiters)
    delimiters = delimiters.to_a.compact.reject(&:empty?)
    delimiters = [DEFAULT_DELIMITER] if delimiters.to_a.compact.empty?

    delimiters.map { |d| Regexp.escape(d) }.join('|')
  end

  private_class_method :delimiter_regex, :parse_numbers
end
