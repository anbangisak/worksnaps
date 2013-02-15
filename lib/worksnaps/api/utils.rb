require 'worksnaps/api/arguments'

module WorkSnaps
  module API
    module Utils

      DEFAULT_CURSOR = -1

    private
      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def object_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path, options)[:body]
        klass.fetch_or_new(object_flatten(klass, response))
      end

      def objects_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path, options)[:body]
        objects_array_from_response(klass, response).map {|object_hash|
          klass.fetch_or_new(object_flatten(klass, object_hash))
        }
      end

      def objects_array_from_response(klass, response)
        objects_hash = response[klass.name.demodulize.tableize]
        objects_hash ? objects_hash.values : []
      end

      def object_flatten(klass, attrs = {})
        attrs ||= {}
        object = attrs[klass.name.demodulize.underscore] || {}
        object.symbolize_keys!
      end
=begin
      # @param request_method [Symbol]
      # @param path [String]
      # @param args [Array]
      # @return [Array<WorkSnaps::User>]
      def threaded_user_objects_from_response(request_method, path, args)
        arguments = WorkSnaps::API::Arguments.new(args)
        arguments.flatten.threaded_map do |user|
          object_from_response(WorkSnaps::User, request_method, path, merge_user(arguments.options, user))
        end
      end

      # @param request_method [Symbol]
      # @param path [String]
      # @param args [Array]
      # @return [Array<WorkSnaps::User>]
      def user_objects_from_response(request_method, path, args)
        arguments = WorkSnaps::API::Arguments.new(args)
        merge_user!(arguments.options, arguments.pop || screen_name) unless arguments.options[:user_id] || arguments.options[:screen_name]
        objects_from_response(WorkSnaps::User, request_method, path, arguments.options)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param args [Array]
      # @return [Array]
      def objects_from_response_with_user(klass, request_method, path, args)
        arguments = WorkSnaps::API::Arguments.new(args)
        merge_user!(arguments.options, arguments.pop)
        objects_from_response(klass, request_method, path, arguments.options)
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Array]
      def objects_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path, options)[:body]
        objects_from_array(klass, response)
      end

      # @param klass [Class]
      # @param array [Array]
      # @return [Array]
      def objects_from_array(klass, array)
        array.map do |element|
          klass.fetch_or_new(element)
        end
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param args [Array]
      # @return [Array]
      def threaded_object_from_response(klass, request_method, path, args)
        arguments = WorkSnaps::API::Arguments.new(args)
        arguments.flatten.threaded_map do |id|
          object_from_response(klass, request_method, path, arguments.options.merge(:id => id))
        end
      end

      # @param klass [Class]
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @return [Object]
      def object_from_response(klass, request_method, path, options={})
        response = send(request_method.to_sym, path, options)
        klass.from_response(response)
      end

      def handle_forbidden_error(klass, error)
        if error.message == klass::MESSAGE
          raise klass.new
        else
          raise error
        end
      end

      def screen_name
        @screen_name ||= verify_credentials.screen_name
      end

      # Take a user and merge it into the hash with the correct key
      #
      # @param hash [Hash]
      # @param user [Integer, String, WorkSnaps::User] A WorkSnaps user ID, screen_name, or object.
      # @return [Hash]
      def merge_user(hash, user, prefix=nil)
        merge_user!(hash.dup, user, prefix)
      end

      # Take a user and merge it into the hash with the correct key
      #
      # @param hash [Hash]
      # @param user [Integer, String, WorkSnaps::User] A WorkSnaps user ID, screen_name, or object.
      # @return [Hash]
      def merge_user!(hash, user, prefix=nil)
        case user
        when Integer
          hash[[prefix, "user_id"].compact.join("_").to_sym] = user
        when String
          hash[[prefix, "screen_name"].compact.join("_").to_sym] = user
        when WorkSnaps::User
          hash[[prefix, "user_id"].compact.join("_").to_sym] = user.id
        end
        hash
      end

      # Take a multiple users and merge them into the hash with the correct keys
      #
      # @param hash [Hash]
      # @param users [Array<Integer, String, WorkSnaps::User>, Set<Integer, String, WorkSnaps::User>] An array of WorkSnaps user IDs, screen_names, or objects.
      # @return [Hash]
      def merge_users(hash, users)
        merge_users!(hash.dup, users)
      end

      # Take a multiple users and merge them into the hash with the correct keys
      #
      # @param hash [Hash]
      # @param users [Array<Integer, String, WorkSnaps::User>, Set<Integer, String, WorkSnaps::User>] An array of WorkSnaps user IDs, screen_names, or objects.
      # @return [Hash]
      def merge_users!(hash, users)
        user_ids, screen_names = [], []
        users.flatten.each do |user|
          case user
          when Integer
            user_ids << user
          when String
            screen_names << user
          when WorkSnaps::User
            user_ids << user.id
          end
        end
        hash[:user_id] = user_ids.join(',') unless user_ids.empty?
        hash[:screen_name] = screen_names.join(',') unless screen_names.empty?
        hash
      end
=end
    end
  end
end
