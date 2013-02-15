module WorkSnaps
  class Version
    MAJOR = 1 unless defined? WorkSnaps::Version::MAJOR
    MINOR = 0 unless defined? WorkSnaps::Version::MINOR
    PATCH = 0 unless defined? WorkSnaps::Version::PATCH
    PRE = nil unless defined? WorkSnaps::Version::PRE

    class << self
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
