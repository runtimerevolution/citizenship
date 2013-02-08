#see: http://geramat.blogs.sapo.pt/13528.html
module Citizenship
  def self.valid_identification_card!(number, check_digit)
    raise ArgumentError, 'number can\'t be nil' if number.nil?
    raise ArgumentError, 'check digit can\'t be nil' if check_digit.nil?

    multiplier = 1
    result = number.delete(' ').split('').map(&:to_i).reverse.map do |digit|
      digit * (multiplier += 1)
    end.reduce(:+) || 0

    raise Error, "Invalid check digit" if (11 - result % 11) != check_digit.to_i
    true
  end

  def self.valid_identification_card?(number, check_digit)
    valid_identification_card!(number, check_digit)
  rescue Error
    false
  end
end