#see: http://geramat.blogs.sapo.pt/13528.html
module Citizenship
  def self.valid_identification_card!(number, check_digit)
    id_number, check_digit = String(number).delete(' '), String(check_digit)

    raise Error, "Invalid size" unless id_number.size == 7 or id_number.size == 8
    raise Error, "Invalid check digit" unless decimal_check_digit_match?(id_number, check_digit)
    number
  end

  def self.valid_identification_card?(number, check_digit)
    valid_identification_card!(number, check_digit)
    true
  rescue Error
    false
  end
end