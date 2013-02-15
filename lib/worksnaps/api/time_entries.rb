require 'worksnaps/time_entry'
require 'worksnaps/api/utils'

module WorkSnaps
  module API
    module TimeEntries
      include WorkSnaps::API::Utils

      def create_task_assignment(p_id, assignment_info)
        object_from_response(WorkSnaps::TaskAssignment, :post, "/api/projects/#{p_id}/task_assignments.xml", {:task_assignment => assignment_info})
      end

      def delete_task_assignment(p_id, assignment_id)
        object_from_response(WorkSnaps::TaskAssignment, :delete, "/api/projects/#{p_id}/task_assignments/#{assignment_id}.xml")
      end

      def time_entry(p_id, entry_id)
        object_from_response(WorkSnaps::TaskAssignment, :get, "/api/projects/#{p_id}/time_entries/#{entry_id}.xml")
      end

      def screen_short(p_id, entry_id)
        object_from_response(WorkSnaps::TaskAssignment, :get, "/api/projects/#{p_id}/time_entries/#{entry_id}.xml?full_resolution_url=1")
      end

      def task_assignments(p_id)
        objects_from_response(WorkSnaps::TaskAssignment, :get, "/api/projects/#{p_id}/task_assignments.xml")
      end
    end
  end
end
