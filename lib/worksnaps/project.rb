require 'worksnaps/base'

module WorkSnaps
  class Project < Base
    attr_reader :id, :name, :description
  end
end
