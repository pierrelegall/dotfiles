# BasicObject monkey patch
class BasicObject
  # Returns the methods names (as symbol) defined
  # in the object class but not in its superclass.
  # Warning: it doesn't return redefined methods.
  def defined_methods
    return methods if self.instance_of? BasicObject
    defined_methods = methods - self.class.superclass.instance_methods
    return defined_methods
  end
end

# Kernel monkey patch
module Kernel
  # Open Emacs at method source
  def emacs(method_name)
    source_location = method(method_name).source_location
    raise 'source location not found' if source_location.nil?
    file, line = source_location
    `emacsclient --no-wait +#{line} '#{file}'`
  end

  alias_method :e, :emacs
end
