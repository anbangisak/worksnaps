require 'worksnaps/error/forbidden'

module WorkSnaps
  class Error
    # Raised when a Tweet has already been retweeted
    class AlreadyRetweeted < WorkSnaps::Error
      MESSAGE = "sharing is not permissible for this status (Share validations failed)"
    end
  end
end
