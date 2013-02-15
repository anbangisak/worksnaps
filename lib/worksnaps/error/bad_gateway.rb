require 'worksnaps/error/server_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 502
    class BadGateway < WorkSnaps::Error::ServerError
      HTTP_STATUS_CODE = 502
      MESSAGE = "WorkSnaps is down or being upgraded."
    end
  end
end
