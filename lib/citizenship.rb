require 'citizenship/version'
require 'citizenship/citizen_card'
require 'citizenship/identification_card'

module Citizenship
  def self.is_number?(i)
    true if Float(i) rescue false
  end

  class Error < StandardError; end
end
