#see: http://pt.wikipedia.org/wiki/N%C3%BAmero_de_identifica%C3%A7%C3%A3o_fiscal
module Citizenship
  def self.valid_nif!(number, options = {})
    strict = options.fetch(:strict, false)
    id_number = strict ? number : String(number).delete(' ')
    first_digit_universe = [1, 2, 5, 6, 8, 9]

    raise NIFError.new(:size) if id_number.size != 9
    raise NIFError.new(:prefix, prefixes: first_digit_universe.join(', ')) unless first_digit_universe.include?(id_number[0].to_i)
    raise NIFError.new(:invalid_check_digit) unless decimal_check_digit_match?(id_number[0..-2], id_number[-1])
    number
  end

  def self.valid_nif?(number, options = {})
    valid_nif!(number, options)
    true
  rescue NIFError
    false
  end
end