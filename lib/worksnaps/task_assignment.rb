require 'worksnaps/base'

module WorkSnaps
  class TaskAssignment < Base
    attr_reader :id, :user_id, :task_id, :project_id
  end
end
