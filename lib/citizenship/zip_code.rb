module Citizenship
  @@zip_codes={}

  def self.valid_zip_code!(zip_code,options={ use_db: :in_memory})
    if options[:full_validation] == true
	load_zip_codes_db_if_necessary
	raise ZipCodeError, :invalid_zip_code unless @@zip_codes.has_key?(zip_code)
    else
    	regexp = /^(\d{4})-(\d{3})$/
    	raise ZipCodeError, :invalid_zip_code unless zip_code.match(regexp)
    end
    zip_code
  end

  def self.valid_zip_code?(zip_code,options={})
    valid_zip_code!(zip_code,options)
    true
  rescue ZipCodeError
    false
  end

#  private

  def self.load_zip_codes_db_if_necessary
	if @@zip_codes.empty?
	  path= File.join(File.dirname(__FILE__), '..'.freeze, 'assets',)
	  File.foreach('lib/assets/zipcodes.db') do |zip|
	    #arr=line.chomp.split(";")
	    #zip="#{arr[0]}-#{arr[1]}"
	    @@zip_codes[zip.chomp]=1
	  end
	end
  end

end
