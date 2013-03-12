#see: http://pt.wikipedia.org/wiki/N%C3%BAmero_de_identifica%C3%A7%C3%A3o_fiscal
module Citizenship
  def self.valid_nif!(number)
    id_number = String(number).delete(' ')
    first_digit_universe = [1, 2, 5, 6, 8, 9]

    raise NIFError, :size if id_number.size != 9
    raise NIFError, :prefix, prefixes: first_digit_universe.join(', ') if first_digit_universe.include?(number[0])
    raise NIFError, :invalid_check_digit unless decimal_check_digit_match?(id_number[0..-2], id_number[-1])
    number
  end

  def self.valid_nif?(number)
    valid_nif!(number)
    true
  rescue NIFError
    false
  end
end