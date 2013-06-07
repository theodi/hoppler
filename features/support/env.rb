$:.unshift File.join( File.dirname(__FILE__), "..", "..", "lib")

require 'rspec/expectations'
require 'dotenv'
require 'timecop'
require 'pry'
require 'spork'

World(RSpec::Matchers)

Spork.prefork do
  Dotenv.load
end

Spork.each_run do  
  require 'hoppler'
end