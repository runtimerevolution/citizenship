#see: http://pt.wikipedia.org/wiki/N%C3%BAmero_de_Identifica%C3%A7%C3%A3o_Banc%C3%A1ria
module Citizenship
  def self.valid_nib!(nib)
    bank_codes = ['0007', '0010', '0018', '0019', '0023', '0025', '0032', '0033', '0034', '0035',
                  '0036', '0038', '0043', '0045', '0046', '0061', '0065', '0076', '0079', '0781',
                  '5180']

    nib_to_validate = String(nib).delete(' ')
    raise Error, "invalid size" unless nib_to_validate.size == 21
    raise Error, "Invalid bank code: #{bank_code}" unless bank_codes.include?(bank_code = nib_to_validate[0..3])

    check_digit = nib_to_validate[19..20].to_i
    nib_to_validate = nib_to_validate[0..18]

    conversion_table = [73, 17, 89, 38, 62, 45, 53, 15, 50, 5, 49, 34, 81, 76, 27, 90, 9, 30, 3]

    sum = (0..18).map do |i|
      nib_to_validate.slice(i).to_i * conversion_table[i]
    end.reduce(:+)

    partial = sum % 97
    control_number = 98 - partial
    raise Error, 'Invalid check digit' unless check_digit == control_number
    nib
  end

  def self.valid_nib?(nib)
    valid_nib!(nib)
    true
  rescue Error
    false
  end
end