require 'worksnaps/error/server_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 500
    class InternalServerError < WorkSnaps::Error::ServerError
      HTTP_STATUS_CODE = 500
      MESSAGE = "Something is technically wrong."
    end
  end
end
