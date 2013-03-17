module Citizenship
  def self.valid_zip_code!(zip_code)
    regexp = /^(\d{4})-(\d{3})$/
    raise ZipCodeError, :invalid_zip_code unless zip_code.match(regexp)
    zip_code
  end

  def self.valid_zip_code?(zip_code)
    valid_zip_code!(zip_code)
    true
  rescue ZipCodeError
    false
  end
end