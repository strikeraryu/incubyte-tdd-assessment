# frozen_string_literal: true

# StringCalculator
class StringCalculator
  def self.add(input)
    raise ArgumentError unless input.is_a? String

    0 if input.nil? || input.empty?
  end
end
