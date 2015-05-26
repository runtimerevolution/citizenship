require 'citizenship/version'
require 'citizenship/errors'
require 'citizenship/nif'
require 'citizenship/nib'
require 'citizenship/citizen_card'
require 'citizenship/identification_card'
require 'citizenship/phone'
require 'citizenship/email'
require 'citizenship/zip_code'
require 'citizenship/rails/validators' if defined?(ActiveModel)

module Citizenship
  private
  #Decimal check bit common processing
  def self.decimal_check_digit(number, cover_digit_collision_flaw = true)
    number = String(number)

    multiplier = 1
    result = number.delete(' ').split('').map(&:to_i).reverse.map do |digit|
      digit * (multiplier += 1)
    end.reduce(:+) || 0

    #Cover for the digit collision flaw?
    return 0 if (control_number = 11 - result % 11) > 9 and cover_digit_collision_flaw
    control_number
  end

  def self.decimal_check_digit_match?(number, check_digit, cover_digit_collision_flaw = true)
    decimal_check_digit(number, cover_digit_collision_flaw) == check_digit.to_i
  end

  def self.is_number?(i)
    true if Float(i) rescue false
  end

  def self.remove_special_chars(str)
    String(str).delete(' ').delete('-').delete('.')
  end
end

I18n.load_path += Dir.glob( File.join(File.dirname(__FILE__), 'locales'.freeze, '*.yml'.freeze) )
