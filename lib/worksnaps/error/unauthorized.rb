module WorkSnaps
  class Error
    class Unauthorized < WorkSnaps::Error
      HTTP_STATUS_CODE = 401
    end
  end
end

