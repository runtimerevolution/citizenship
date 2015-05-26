module Citizenship
  @zip_codes={}

  def self.valid_zip_code!(zip_code,options={})
    if options[:full_validation] == true
	load_zip_codes_db_if_necessary
	raise ZipCodeError, :invalid_zip_code unless zip_codes.has_key?(zip)
    else
    	regexp = /^(\d{4})-(\d{3})$/
    	raise ZipCodeError, :invalid_zip_code unless zip_code.match(regexp)
    end
    zip_code
  end

  def self.valid_zip_code?(zip_code,options={})
    valid_zip_code!(zip_code)
    true
  rescue ZipCodeError
    false
  end

  private
  def load_zip_codes_db_if_necessary
	if @zip_codes.empty?
	  File.foreach('lib/assets/zipcodes.db') do |line|
	    arr=line.chomp.split(";")
	    zip="#{arr[0]}-#{arr[1]}"
	    @zip_codes[zip]=1
	  end
	end
  end

end
