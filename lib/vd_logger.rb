require 'singleton'
class VdLogger
include Singleton
def initialize
@log = File.open("vdlog.txt", "a")
end
def logInformation(information)
@log.puts(information)
@log.flush
end
end