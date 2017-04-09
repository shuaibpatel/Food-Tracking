class ShakeObserver < ActiveRecord::Observer
def after_update(record)
# use the MyLogger instance method to retrieve the single instance/object of the class
@logger = MyLogger.instance
# use the logger to log/record a message about the updated car
@logger.logInformation("###############Observer Demo:#")
@logger.logInformation("+++ ShakeObserver: The Shake of
#{record.Name} #{record.Calories}
has been updated. cost #{record.Cost}")
@logger.logInformation("##############################")
end
end