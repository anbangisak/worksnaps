require 'worksnaps/error/forbidden'

module WorkSnaps
  class Error
    # Raised when a Tweet has already been favorited
    class AlreadyFavorited < WorkSnaps::Error
      MESSAGE = "You have already favorited this status"
    end
  end
end
