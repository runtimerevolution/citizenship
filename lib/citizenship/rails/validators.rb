module Citizenship
  module Rails
    module Validators
      class NifValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          Citizenship.valid_nif!(value, options) if value.present?
        rescue Citizenship::NIFError => e
          record.errors[attribute] << (options[:message] || e.message)
        end
      end

      class NibValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          Citizenship.valid_nib!(value, options) if value.present?
        rescue Citizenship::NIBError => e
          record.errors[attribute] << (options[:message] || e.message)
        end
      end

      class PhoneValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          Citizenship.valid_phone!(value, options) if value.present?
        rescue Citizenship::PhoneError => e
          record.errors[attribute] << (options[:message] || e.message)
        end
      end

      class EmailValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          Citizenship.valid_email!(value) if value.present?
        rescue Citizenship::EmailError => e
          record.errors[attribute] << (options[:message] || e.message)
        end
      end

      class ZipCodeValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          Citizenship.valid_zip_code!(value) if value.present?
        rescue Citizenship::ZipCodeError => e
          record.errors[attribute] << (options[:message] || e.message)
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, Citizenship::Rails::Validators)