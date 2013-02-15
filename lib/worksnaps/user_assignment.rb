require 'worksnaps/base'

module WorkSnaps
  class UserAssignment < Base
    attr_reader :id, :project_id, :user_id, :hourly_rate, :role
  end
end
