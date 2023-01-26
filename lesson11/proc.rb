require 'pry'

class Measurable
  def self.log_time
    start_time = Time.now
    res = yield
    puts "Это заняло #{Time.now - start_time}"
    res
  end
end

class A
  attr_reader :block

  def initialize(&block)
    @block = block
  end

  def f(_num = 10_000)
    puts 'first method'
    @block.call
  end

  def test
    puts 'second method'
    @block.call
  end
end

def f1
  puts 'start'
  yield if block_given?
  puts 'end'
end

def f2(&block)
  puts 'start'

  puts 'end'
end

l = -> do
 puts 'test123'
end



binding.pry
