# frozen_string_literal: true

# StringCalculator
class StringCalculator
  def self.add(input)
    raise ArgumentError if input.is_a?(Array) || input.is_a?(Integer)

    0 if input.nil? || input.empty?
  end
end
