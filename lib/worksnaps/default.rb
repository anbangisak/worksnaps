require 'faraday'
require 'worksnaps/error/client_error'
require 'worksnaps/error/server_error'
#require 'faraday/request/multipart'
#require 'worksnaps/request/multipart_with_file'
#require 'worksnaps/response/parse_json'
require 'worksnaps/response/parse_xml'
require 'worksnaps/response/raise_error'
require 'worksnaps/version'

module WorkSnaps
  module Default
    ENDPOINT = 'http://www.worksnaps.net' unless defined? WorkSnaps::Default::ENDPOINT
    CONNECTION_OPTIONS = {
      :headers => {
        :accept => 'application/xml',
        'Content-Type' => 'application/xml',
        :user_agent => "WorkSnaps Ruby Gem #{WorkSnaps::Version}",
      },
      :request => {
        :open_timeout => 5,
        :timeout => 10,
      },
      :ssl => {
        :verify => false
      },
    } unless defined? WorkSnaps::Default::CONNECTION_OPTIONS
    IDENTITY_MAP = false unless defined? WorkSnaps::Default::IDENTITY_MAP
    MIDDLEWARE = Faraday::Builder.new do |builder|
      # Convert request params to "www-form-urlencoded"
      builder.use Faraday::Request::UrlEncoded
      # Parse response in XML format to hash
      builder.use WorkSnaps::Response::ParseXML
      # Handle 4xx server responses
      builder.use WorkSnaps::Response::RaiseError, WorkSnaps::Error::ClientError
      # Handle 5xx server responses
      builder.use WorkSnaps::Response::RaiseError, WorkSnaps::Error::ServerError
      # Set Faraday's HTTP adapter
      builder.adapter Faraday.default_adapter
    end unless defined? WorkSnaps::Default::MIDDLEWARE

    class << self
      def options
        Hash[WorkSnaps.keys.map{|key| [key, send(key)]}]
      end

      # @return [String]
      def api_tocken
        ENV['WORKSNAPS_API_TOCKEN']
      end

      # @return [String]
      def consumer_key
        ENV['WORKSNAPS_CONSUMER_KEY']
      end

      # @return [String]
      def consumer_secret
        ENV['WORKSNAPS_CONSUMER_SECRET']
      end

      # @return [String]
      def oauth_token
        ENV['WORKSNAPS_OAUTH_TOKEN']
      end

      # @return [String]
      def oauth_token_secret
        ENV['WORKSNAPS_OAUTH_TOKEN_SECRET']
      end

      def endpoint
        ENDPOINT
      end

      def connection_options
        CONNECTION_OPTIONS
      end

      def identity_map
        IDENTITY_MAP
      end

      # @note Faraday's middleware stack implementation is comparable to that of Rack middleware.  The order of middleware is important: the first middleware on the list wraps all others, while the last middleware is the innermost one.
      # @see https://github.com/technoweenie/faraday#advanced-middleware-usage
      # @see http://mislav.uniqpath.com/2011/07/faraday-advanced-http/
      # @return [Faraday::Builder]
      def middleware
        MIDDLEWARE
      end

    end
  end
end
