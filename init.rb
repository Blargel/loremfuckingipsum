Encoding.default_external = 'UTF-8'

require "bundler/setup"
Bundler.require

(
  ['./server.rb'] +
  Dir['./lib/**/*.rb'].sort
).uniq.each { |rb| require rb }
