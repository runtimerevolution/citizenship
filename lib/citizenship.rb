require 'citizenship/version'
require 'citizenship/citizen_card'

module Citizenship
  def is_number?(i)
    true if Float(i) rescue false
  end

  class Error < StandardError; end
end
