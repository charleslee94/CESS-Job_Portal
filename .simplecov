require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter 'app/helpers'
  #temporary, since its empty
  add_filter 'app/models/user.rb'
end
