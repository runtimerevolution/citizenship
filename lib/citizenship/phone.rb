module Citizenship
  def self.valid_phone!(number, opts = {})
    strip_country_prefix = opts.fetch(:strip_country_prefix, false)
    prefix_whitelist = network_prefix_white_list(opts[:only_prefixes])

    country_prefix = '((\+351|00351|351)?)'
    regexp_template = "^#{country_prefix}(#{prefix_whitelist}\\d{7})$"

    phone_number = String(number).delete(' ').delete('-')
    raise PhoneError, :invalid_phone_number unless phone_number.match(Regexp.new(regexp_template))

    return number.sub(Regexp.new(country_prefix), '').lstrip if strip_country_prefix
    number
  end

  def self.valid_phone?(number, opts = {})
    valid_phone!(number, opts)
    true
  rescue Error
    false
  end

  private
  def self.network_prefix_white_list(prefixes)
    return '(2\d{1}|(9(3|6|2|1)))' if prefixes.nil?
    prefixes.is_a?(Array) ? "(#{prefixes.map(&:to_s).join('|')})" : "(#{prefixes})"
  end
end
