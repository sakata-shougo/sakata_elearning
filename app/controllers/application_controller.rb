class ApplicationController < ActionController::Base
 # By default Helpers are only available to the VIEW, so we must let the Controller access it too
 include SessionsHelper
end
