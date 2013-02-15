require 'worksnaps/error/server_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 504
    class GatewayTimeout < WorkSnaps::Error::ServerError
      HTTP_STATUS_CODE = 504
      MESSAGE = "The WorkSnaps servers are up, but the request couldn't be serviced due to some failure within our stack. Try again later."
    end
  end
end
