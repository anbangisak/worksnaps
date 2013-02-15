require 'worksnaps/task'
require 'worksnaps/api/utils'

module WorkSnaps
  module API
    module Tasks
      include WorkSnaps::API::Utils

      def create_task(p_id, task_info)
        object_from_response(WorkSnaps::Task, :post, "/api/projects/#{p_id}/tasks.xml", {:task => task_info})
      end

      def update_task(p_id, t_id, task_info)
        object_from_response(WorkSnaps::Task, :put, "/api/projects/#{p_id}/tasks/#{t_id}.xml", {:task => task_info})
      end

      def delete_task(p_id, t_id)
        object_from_response(WorkSnaps::Task, :delete, "/api/projects/#{p_id}/tasks/#{t_id}.xml")
      end

      def task(p_id, t_id)
        object_from_response(WorkSnaps::Task, :get, "/api/projects/#{p_id}/tasks/#{t_id}.xml")
      end

      def tasks(p_id)
        objects_from_response(WorkSnaps::Task, :get, "/api/projects/#{p_id}/tasks.xml")
      end
    end
  end
end
