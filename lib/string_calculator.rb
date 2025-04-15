# frozen_string_literal: true

# StringCalculator
class StringCalculator
  def self.add(input)
    raise ArgumentError unless input.is_a? String

    return 0 if input.nil? || input.empty?

    numbers = input.split(',').map(&:to_i)

    numbers.inject(:+)
  end
end
