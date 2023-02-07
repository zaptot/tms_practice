require 'pry'

module CustomAttrReader
  def my_custom_attr_reader(*attrs)
    attrs.each do |attr|
      define_method(attr) do
        instance_variable_get("@#{attr}")
      end
    end
    puts "Аттрибуты #{attrs}"
  end
end

class A
  extend CustomAttrReader

  my_custom_attr_reader :a

  def initialize(a, b)
    @a = a
    @b = b
  end
end



module AttrReader
  def attr_reader(*attributes)
    attributes.each do |attribute|
      define_method(attribute) do
        p 'bla-bla'
        instance_variable_get("@#{attribute}")
      end
    end
  end
end

class ExampleClass
  extend AttrReader

  attr_reader :attribute1, :attribute2

  def initialize(attribute1, attribute2)
    @attribute1 = attribute1
    @attribute2 = attribute2
  end
end

a = ExampleClass.new(:a, :b)
binding.pry
