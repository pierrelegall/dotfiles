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
