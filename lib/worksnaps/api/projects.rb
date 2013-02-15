require 'worksnaps/project'
require 'worksnaps/api/utils'

module WorkSnaps
  module API
    module Projects
      include WorkSnaps::API::Utils

      def create_project(project_info)
        object_from_response(WorkSnaps::Project, :post, '/api/projects.xml', {:project => project_info})
      end

      def update_project(p_id, project_info)
        object_from_response(WorkSnaps::Project, :put, "/api/projects/#{p_id}.xml", {:project => project_info})
      end

      def project(p_id)
        object_from_response(WorkSnaps::Project, :get, "/api/projects/#{p_id}.xml")
      end

      def projects
        objects_from_response(WorkSnaps::Project, :get, '/api/projects.xml')
      end
    end
  end
end
