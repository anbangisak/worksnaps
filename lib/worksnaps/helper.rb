class Hash
  def to_xml(depth = 0)
    map{|k,v|
      body = v.is_a?(Hash) ? ("\n" + v.to_xml(depth + 1)) : v.to_s
      "%s<%s>%s</%s>\n" % [" " * depth, k.to_s, body, k.to_s]
    }.join
  end

  def symbolize_keys!
  	inject({}) {|m, (k,v)|
  		m[k.to_sym] = v.is_a?(Hash) ? v.symbolize_keys! : v
  		m
  	}
  end
end

=begin
class String
  def demodulize
    if i = self.rindex('::')
      self[(i+2)..-1]
    else
      self
    end
  end

  def underscore
    self.gsub!(/::/, '/')
    self.gsub!(/(?:([A-Za-z\d])|^)(#{inflections.acronym_regex})(?=\b|[^a-z])/) { "#{$1}#{$1 && '_'}#{$2.downcase}" }
    self.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
    self.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    self.tr!("-", "_")
    self.downcase!
    self + 's'
  end
end
=end