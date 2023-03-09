module Accessors

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      values = []

      define_method(name.to_sym) { instance_variable_get(var_name) }
      define_method("#{name=}".to_sym) do |value|
        instance_variable_set(var_name, value)
        values << value
      end
      define_method("#{name}_history".to_sym) { values }
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise "Неверный тип!" unless value.kind_of? type
      instance_variable_set(var_name, value)
    end
  end
end