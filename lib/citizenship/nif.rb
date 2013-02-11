#see: http://pt.wikipedia.org/wiki/N%C3%BAmero_de_identifica%C3%A7%C3%A3o_fiscal
module Citizenship
  def self.valid_nif!(number)
    id_number = String(number).delete(' ')
    first_digit_universe = [1, 2, 5, 6, 8, 9]

    raise Error, "NIF must have 9 digits" if id_number.size != 9
    raise Error, "NIF first number has to be one of the following: #{first_digit_universe.join(', ')}" if first_digit_universe.include?(number[0])
    raise Error, "Invalid check digit" unless decimal_check_digit_match?(id_number[0..-2], id_number[-1])
    number
  end

  def self.valid_nif?(number)
    valid_nif!(number)
    true
  rescue Error
    false
  end
end