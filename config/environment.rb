# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Demo::Application.initialize!

# common configuration

Demo::Application.configure do 
	config.action_mailer.delivery_method = :smtp
	
	config.action_mailer.smtp_settings = {
		:address => "localhost",
		:port => 25,
	}	
	
	config.gem "authlogic"
end
