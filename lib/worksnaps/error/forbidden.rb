require 'worksnaps/error/client_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 403
    class Forbidden < WorkSnaps::Error::ClientError
      HTTP_STATUS_CODE = 403
    end
  end
end
