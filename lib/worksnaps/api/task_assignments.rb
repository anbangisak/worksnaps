require 'worksnaps/task_assignment'
require 'worksnaps/api/utils'

module WorkSnaps
  module API
    module TaskAssignments
      include WorkSnaps::API::Utils

      def create_task_assignment(p_id, assignment_info)
        object_from_response(WorkSnaps::TaskAssignment, :post, "/api/projects/#{p_id}/task_assignments.xml", {:task_assignment => assignment_info})
      end

      def delete_task_assignment(p_id, assignment_id)
        object_from_response(WorkSnaps::TaskAssignment, :delete, "/api/projects/#{p_id}/task_assignments/#{assignment_id}.xml")
      end

      def task_assignment(p_id, assignment_id)
        object_from_response(WorkSnaps::TaskAssignment, :get, "/api/projects/#{p_id}/task_assignments/#{assignment_id}.xml")
      end

      def task_assignments(p_id)
        objects_from_response(WorkSnaps::TaskAssignment, :get, "/api/projects/#{p_id}/task_assignments.xml")
      end
    end
  end
end
