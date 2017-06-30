# BasicObject monkey patch
class BasicObject
  # Returns the methods names (as symbol) defined
  # inside the object class.
  def internal_methods
    return methods if self.instance_of? BasicObject
    methods.select { |method_name| method(method_name).owner == self.class }
  end

  # Returns the methods names (as symbol) defined
  # outside the object class.
  # Warning: it doesn't return overrided methods.
  def external_methods
    (inherited_methods + extended_methods + included_methods).uniq
  end

  # Returns overrided methods.
  def overrided_methods
    internal_methods & external_methods
  end

  # Returns inherited methods.
  def inherited_methods
    self.class.superclass.instance_methods
  end

  # Returns extended methods.
  def extended_methods
    self.class.singleton_class.included_modules.reduce [] do |acc, wodule|
      acc + wodule.instance_methods
    end
  end

  # Returns included methods.
  def included_methods
    self.class.included_modules.reduce [] do |acc, wodule|
      acc + wodule.instance_methods
    end
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
