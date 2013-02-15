require 'worksnaps/error/client_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 404
    class NotFound < WorkSnaps::Error::ClientError
      HTTP_STATUS_CODE = 404
    end
  end
end
