require 'worksnaps/error/client_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 400
    class BadRequest < WorkSnaps::Error::ClientError
      HTTP_STATUS_CODE = 400
    end
  end
end
