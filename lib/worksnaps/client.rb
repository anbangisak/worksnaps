require 'faraday'
#require 'simple_oauth'
require 'worksnaps/error'
require 'worksnaps/api/users'
require 'worksnaps/api/tasks'
require 'worksnaps/api/projects'
require 'worksnaps/api/user_assignments'
require 'worksnaps/api/task_assignments'

module WorkSnaps
  class Client
    include WorkSnaps::API::Users
    include WorkSnaps::API::Tasks
    include WorkSnaps::API::Projects
    include WorkSnaps::API::UserAssignments
    include WorkSnaps::API::TaskAssignments

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [WorkSnaps::Client]
    def initialize(options={})
      WorkSnaps.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || WorkSnaps.instance_variable_get(:"@#{key}"))
      end
    end

    # Perform an HTTP DELETE request
    def delete(path, params={})
      request(:delete, path, params)
    end

    # Perform an HTTP GET request
    def get(path, params={})
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    def post(path, params={})
      signature_params = params.values.any?{|value| value.respond_to?(:to_io)} ? {} : params
      request(:post, path, params.to_xml, signature_params)
    end

    # Perform an HTTP PUT request
    def put(path, params={})
      request(:put, path, params)
    end

  private

    def request(method, path, params={}, signature_params=params)
      connection.send(method.to_sym, path, params) do |request|
        request.headers[:authorization] = auth_header(method.to_sym, path, signature_params).to_s
      end.env
    rescue Faraday::Error::ClientError
      raise WorkSnaps::Error::ClientError
    end

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection
      @connection ||= Faraday.new(@endpoint, @connection_options.merge(:builder => @middleware))
    end

    def auth_header(method, path, params={})
      # Oauth
      # uri = URI(@endpoint + path)
      # SimpleOAuth::Header.new(method, uri, params, WorkSnaps.oauth_credentials)

      # Basic auth
      Faraday::Request::BasicAuthentication.header(WorkSnaps.api_tocken, '')
    end

  end
end
