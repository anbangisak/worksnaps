require 'worksnaps/error/client_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 404
    class UnprocessableEntity < WorkSnaps::Error::ClientError
      HTTP_STATUS_CODE = 422
    end
  end
end
