module Citizenship
  def self.valid_phone!(number, opts = {})
    strip_country_prefix =  opts.fetch(:strip_country_prefix, false)
    allow_prefixes = if only_prefixes = opts[:only_prefixes]
                        only_prefixes.is_a?(Array) ? "(#{only_prefixes.map(&:to_s).join('|')})"
                                                   : "(#{only_prefixes})"
                      else
                        '(2\d{1}|(9(3|6|2|1)))'
                      end

    country_prefix = '((\+351|00351|351)?)'
    regexp_template = "^#{country_prefix}(#{allow_prefixes}\\d{7})$"

    phone_number = String(number).delete(' ').delete('-')

    raise Error, "Invalid phone number: #{number}" unless phone_number.match(Regexp.new(regexp_template))

    return number.sub(Regexp.new(country_prefix), '').lstrip if strip_country_prefix
    number
  end

  def self.valid_phone?(number, opts = {})
    valid_phone!(number, opts)
    true
  rescue Error
    false
  end
end
