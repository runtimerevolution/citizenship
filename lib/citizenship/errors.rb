require 'pathname'
require 'i18n'

I18n.load_path += Dir[Pathname.new(File.expand_path('lib')).join('locales', '*.{rb,yml}')]
I18n.default_locale = "pt-PT"

module Citizenship
  class Error < StandardError
    def initialize(key, values = {}, scope)
      super(I18n.t(key, values.merge(scope: "citizenship.#{scope}")))
    end
  end

  class NIFError < Error
    def initialize(key, values = {})
      super(key, values, :nif)
    end
  end

  class NIBError < Error
    def initialize(key, values = {})
      super(key, values, :nib)
    end
  end

  class CitizenCardError < Error
    def initialize(key, values = {})
      super(key, values, :citizen_card)
    end
  end

  class IdentificationCardError < Error
    def initialize(key, values = {})
      super(key, values, :identification_card)
    end
  end

  class PhoneError < Error
    def initialize(key, values = {})
      super(key, values, :phone)
    end
  end

  class EmailError < Error
    def initialize(key, values = {})
      super(key, values, :email)
    end
  end

  class ZipCodeError < Error
    def initialize(key, values = {})
      super(key, values, :zip_code)
    end
  end
end