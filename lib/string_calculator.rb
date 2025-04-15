# frozen_string_literal: true

# StringCalculator
class StringCalculator
  def self.add(input)
    raise ArgumentError if input.is_a?(Array)

    0 if input.nil? || input.empty?
  end
end
