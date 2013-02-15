require 'worksnaps/error/client_error'

module WorkSnaps
  class Error
    # Raised when WorkSnaps returns the HTTP status code 429
    class TooManyRequests < WorkSnaps::Error::ClientError
      HTTP_STATUS_CODE = 429
    end
    EnhanceYourCalm = TooManyRequests
    RateLimited = TooManyRequests
  end
end
