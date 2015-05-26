# Citizenship

[![Build Status](https://travis-ci.org/runtimerevolution/citizenship.svg?branch=master)](https://travis-ci.org/runtimerevolution/citizenship)
[![Code Climate](https://codeclimate.com/github/runtimerevolution/citizenship/badges/gpa.svg)](https://codeclimate.com/github/runtimerevolution/citizenship)

Citizenship provides a set of easy validations on personal documents, addresses, bank account numbers and other personal information, of Portuguese citizens or of citizens living in Portugal ;)

It supports validation of:

- NIB (i.e. "banking account number")
- NIF (i.e. "fiscal number")
- local phone numbers
- identification card ('bilhetes de identidade'), were the old id Portuguese id documents. They are no longer issue, but many haven't yet expired, so are still used alongside the Citizen Card.
- citizen card ('cartão do cidadão'), are the new ID cards currently in use
- zip code (partial validation)
- e-mail (well, just because :) )


## Installation

Add this line to your Rails application's Gemfile:

    gem 'citizenship'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install citizenship

and use it standalone.

## Validations

### NIB

```ruby 
result=Citizenship.valid_nib?("003503730000539151280") # returns true
result=Citizenship.valid_nib?('0035.03730000539.1512.80') # returns true
result=Citizenship.valid_nib?('38476129847') # returns false (since it fails proper size and CRC)
result=Citizenship.valid_nib?('0035.03730000539.1512.80', strict: true) # returns false
Citizenship.valid_nib!(nib) # raises Citizenship::Error if invalid
```

### NIF

```ruby 
result=Citizenship.valid_nif?("123456789") # returns true
Citizenship.valid_nif!(nif) # raises Citizenship::Error if invalid
nif=Citizenship.valid_nif!("123456789") # returns "123456789"
result=Citizenship.valid_nif?(' 123456789', strict: true) # returns false (strict validation disallows whitespaces and others)
```

### Phone Number

```ruby 
phone=Citizenship.valid_phone!('+351 96 933 2233', only_prefixes: ['93', '96']) # returns "+351 96 933 2233"
phone=Citizenship.valid_phone!('262-999-666') # returns "262-999-666"
result=Citizenship.valid_phone?('262999666', strict: true) # returns true
result=Citizenship.valid_phone?('+351 93 933 2233', allow_country_prefix: false) # returns false (since country prefix was used)
phone=Citizenship.valid_phone!('+351 93 933 2233') # returns "+351 93 933 2233"
```

### Identification Card

```ruby 
result=Citizenship.valid_identification_card?('156 944 80', '4') # returns true
id=Citizenship.valid_identification_card!('156 944 8', '8') # returns '156 944 8'
```

### Citizen Card

```ruby 
result=Citizenship.valid_citizen_card?('00000000 0 ZZ 4') # returns true
id=Citizenship.valid_citizen_card('00000000-0-ZZ-4') # returns '00000000-0-ZZ-4'
```

### Zip Code

```ruby 
result=Citizenship.valid_zip_code?('1000-100') # returns true
```

### E-mail

```ruby 
result=Citizenship.valid_email?("user@example.org") # returns true
result=Citizenship.valid_email?("  user@example.org ") # returns false (due to whitespaces)
result=Citizenship.valid_email?("@example.org") # returns false (due to missing user)
```

## Rails Validators

We provide a useful range of Rails validators that you can include in your models, namely:

* NifValidator
* NibValidator
* PhoneValidator
* EmailValidator
* ZipCodeValidor

### Example


    class User < ActiveRecord::Base
      validates :fiscal_number, nif: true
      ...
    end
 

## Future Developments

* Support full zip code validation
* Support IBAN
* Support validating documents for other EU countries

## References

* [NIB](http://pt.wikipedia.org/wiki/N%C3%BAmero_de_Identifica%C3%A7%C3%A3o_Banc%C3%A1ria)
* [NIF](http://pt.wikipedia.org/wiki/N%C3%BAmero_de_identifica%C3%A7%C3%A3o_fiscal)
* [Citizen Card](http://www.cartaodecidadao.pt/images/stories/Algoritmo_Num_Documento_CC.pdf)
* [(old) Identification Card](http://geramat.blogs.sapo.pt/13528.html)
* [ZIP codes](http://pt.wikipedia.org/wiki/N%C3%BAmero_de_Identifica%C3%A7%C3%A3o_Banc%C3%A1ria)



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright © 2015 [Runtime Revolution](http://www.runtime-revolution.com), released under the MIT license.

