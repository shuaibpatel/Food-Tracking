#saved in the file app/models/need_observer.rb
require 'sp_logger'
class NeedObserver < ActiveRecord::Observer
def after_update(record)
# use the SyLogger instance method to retrieve the single instance/object of the class
@logger = SpLogger.instance
# use the logger to log/record a message about the updated car
@logger.logInformation("###############Observer Demo:#")
@logger.logInformation("+++ NeedObserver: The need of
#{record.firstname} #{record.lastname}
has been updated. cost #{record.cost}")
@logger.logInformation("##############################")
end
end