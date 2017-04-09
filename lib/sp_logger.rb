require 'singleton'
class SpLogger
include Singleton
def initialize
@log = File.open("splog.txt", "a")
end
def logInformation(information)
@log.puts(information)
@log.flush
end
end