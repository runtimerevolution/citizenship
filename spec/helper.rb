require 'simplecov'
require 'pry'

#setup simplecov
SimpleCov.start do
  add_filter "/spec"
end

require File.expand_path('../../lib/citizenship', __FILE__)
