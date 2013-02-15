require 'worksnaps/error'

module WorkSnaps
  class Error
    # Raised when JSON parsing fails
    class DecodeError < WorkSnaps::Error
    end
  end
end
