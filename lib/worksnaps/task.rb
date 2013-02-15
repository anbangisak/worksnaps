require 'worksnaps/base'

module WorkSnaps
  class Task < Base
    attr_reader :id, :name, :description
  end
end
