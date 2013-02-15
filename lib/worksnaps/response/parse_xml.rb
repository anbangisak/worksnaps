require 'faraday'
require 'crack/xml'

module WorkSnaps
  module Response
    class ParseXML < Faraday::Response::Middleware

      def parse(body)
        body = Crack::XML.parse(body)
        if body['method'] == :post or body['method'] == :put
          reply = body.delete('reply')
          body.merge reply if reply.is_a(Hash)
        end
        body
      end

      def on_complete(env)
        if respond_to?(:parse)
          env[:body] = parse(env[:body]) unless [204, 301, 302, 304].include?(env[:status])
        end
      end

    end
  end
end
