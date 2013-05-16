Encoding.default_external = 'UTF-8'

require "bundler/setup"
Bundler.require

(
  ['./server.rb']
).uniq.each { |rb| require rb }
