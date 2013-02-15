require 'worksnaps/error/server_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 503
    class ServiceUnavailable < WorkSnaps::Error::ServerError
      HTTP_STATUS_CODE = 503
      MESSAGE = "(__-){ WorkSnaps is over capacity."
    end
  end
end
