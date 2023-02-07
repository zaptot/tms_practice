# надо расширить функционал хэша, чтобы можно было обращаться к ключам через точку
# method_missing(method_name, params, &block)

require 'pry'

class MyStruct
  def initialize(hash)
    @hash = hash
  end

  def method_missing(method_name, *)
    if @hash.key?(method_name)
      @hash[method_name]
    elsif @hash.key?(method_name.to_s)
      @hash[method_name.to_s]
    else
      super
    end
  end
end

a = {:test=>"first key", :test1=>"second_key"}
h = MyStruct.new(a)
binding.pry