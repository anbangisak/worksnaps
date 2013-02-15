require 'worksnaps/user_assignment'
require 'worksnaps/api/utils'

module WorkSnaps
  module API
    module UserAssignments
      include WorkSnaps::API::Utils

      def create_user_assignment(p_id, assignment_info)
        object_from_response(WorkSnaps::UserAssignment, :post, "/api/projects/#{p_id}/user_assignments.xml", {:user_assignment => assignment_info})
      end

      def update_user_assignment(p_id, assignment_id, assignment_info)
        object_from_response(WorkSnaps::UserAssignment, :put, "/api/projects/#{p_id}/user_assignments/#{assignment_id}.xml", {:user_assignment => project_info})
      end

      def delete_user_assignment(p_id, assignment_id)
        object_from_response(WorkSnaps::UserAssignment, :delete, "/api/projects/#{p_id}/user_assignments/#{assignment_id}.xml")
      end

      def user_assignment(p_id, assignment_id)
        object_from_response(WorkSnaps::UserAssignment, :get, "/api/projects/#{p_id}/user_assignments/#{assignment_id}.xml")
      end

      def user_assignments(p_id)
        objects_from_response(WorkSnaps::UserAssignment, :get, "/api/projects/#{p_id}/user_assignments.xml")
      end
    end
  end
end
