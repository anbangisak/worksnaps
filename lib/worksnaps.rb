
$:.unshift File.dirname(__FILE__)
require 'active_support/inflector'
require 'worksnaps/helper'
require 'worksnaps/client'
require 'worksnaps/default'

module WorkSnaps
  class << self
    extend Forwardable
    attr_writer :api_tocken, :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret
    attr_accessor :endpoint, :connection_options, :identity_map, :middleware
    def_delegator :options, :hash

    def keys
      @keys ||= [
        :api_tocken,
        :consumer_key,
        :consumer_secret,
        :oauth_token,
        :oauth_token_secret,
        :endpoint,
        :connection_options,
        :identity_map,
        :middleware,
      ]
    end

    def oauth_credentials
      {
        :consumer_key => @consumer_key,
        :consumer_secret => @consumer_secret,
        :token => @oauth_token,
        :token_secret => @oauth_token_secret,
      }
    end

    def api_tocken
      @api_tocken
    end

    def configure
      yield self
      self
    end

    def reset!
      keys.each do |key|
        instance_variable_set(:"@#{key}", WorkSnaps::Default.options[key])
      end
      self
    end
    alias setup reset!

    def client
      @client ||= WorkSnaps::Client.new
    end

    def respond_to_missing?(method_name, include_private=false); client.respond_to?(method_name, include_private); end if RUBY_VERSION >= "1.9"
    def respond_to?(method_name, include_private=false); client.respond_to?(method_name, include_private) || super; end if RUBY_VERSION < "1.9"

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end

WorkSnaps.setup
