require 'worksnaps/base'

module WorkSnaps
  class User < Base
    attr_reader :id, :login, :first_name, :last_name, :password, 
    						:email, :timezone_id, :is_in_daylight_time, :timezone_name

    def full_name
    	[last_name, first_name].join(', ')
    end

  end
end
