require 'worksnaps/error/client_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 406
    class NotAcceptable < WorkSnaps::Error::ClientError
      HTTP_STATUS_CODE = 406
    end
  end
end
