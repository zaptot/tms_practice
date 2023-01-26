require 'pry'
require 'date'

Array.new(1_000_000, rand(1..1_000_000)).sum

class TimeLogger
  def self.log
    start_time = Time.now
    res = yield
    puts "It take #{Time.now - start_time}"
    res
  end
end

class Shop
  def initialize(name, products = [])
    @name = name
    @products = products
  end

  def filter_by_type(type)
    product_selector { |product| product.type == type }
  end

  def filter_by_company(company_name)
    product_selector { |product| product.author == company_name }
  end

  def <<(product)
    @products << product
  end
  alias add_product <<

  private

  def product_selector
    TimeLogger.log { @products.select { |product| yield(product) } }
  end
end

class Product
  attr_reader :type, :expiration_date, :author

  def initialize(type, expiration_date, author)
    @type = type
    @expiration_date = expiration_date
    @author = author
  end
end

s = Shop.new('vitalur', [Product.new('milk', DateTime.parse('28-01-2023'), 'milk company')])
s.add_product(Product.new('milk', DateTime.parse('26-01-2023'), 'milk company'))
s.add_product(Product.new('milk', DateTime.parse('27-01-2023'), 'milk company'))
s.add_product(Product.new('milk', DateTime.parse('29-01-2023'), 'milk company'))
s.add_product(Product.new('chips', DateTime.parse('29-06-2023'), 'lays'))
s.add_product(Product.new('chocolate', DateTime.parse('15-04-2023'), 'milka'))
s.add_product(Product.new('water', DateTime.parse('06-05-2024'), 'coca cola'))
s.add_product(Product.new('sugar', DateTime.parse('29-01-2025'), 'sugar company'))

binding.pry