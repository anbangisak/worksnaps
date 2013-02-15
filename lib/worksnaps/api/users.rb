require 'worksnaps/user'
require 'worksnaps/api/utils'

module WorkSnaps
  module API
    module Users
      include WorkSnaps::API::Utils

      def create_user(user_info)
        object_from_response(WorkSnaps::User, :post, '/api/users.xml', {:user => user_info})
      end

      def update_user(user_id, user_info)
        object_from_response(WorkSnaps::User, :put, "/api/users/#{user_id}.xml", {:user => user_info})
      end

      def user(user_id)
        object_from_response(WorkSnaps::User, :get, "/api/users/#{user_id}.xml")
      end

      def current_user
        object_from_response(WorkSnaps::User, :get, '/api/me.xml')
      end
    end
  end
end
