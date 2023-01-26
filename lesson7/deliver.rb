require 'pry'

class Product
  attr_reader :volume, :weight

  def initialize(volume, weight)
    @volume = volume
    @weight = weight
  end
end

class Deliver
  attr_reader :products, :path_lenght

  def initialize(path_lenght)
    @products = []
    @path_lenght = path_lenght
  end

  def add_product(product)
    @products << product
  end

  def current_price
    raise NotImplementedError
  end

  def deliver_time
    raise NotImplementedError
  end

  def deliver
    return puts 'нечего доставлять' unless can_deliver?

    products.pop(products.size)
  end

  private

  def can_deliver?
    products.size >= self.class::MIN_PRODUCTS_TO_DELIVER
  end
end

class AirDeliver < Deliver
  MIN_PRODUCTS_TO_DELIVER = 5

  def deliver
    puts 'я полетел' if can_deliver?
    super
  end
end

class LandDeliver < Deliver
  MIN_PRODUCTS_TO_DELIVER = 1

  def deliver
    puts 'я поехал' if can_deliver?
    super
  end
end

class PlainDeliver < AirDeliver
  def current_price
    products.sum { |product| (product.volume * 2) + (product.weight * 10) } * path_lenght / 10.0
  end

  def deliver_time
    path_lenght / 700.0
  end
end

class TrainDeliver < LandDeliver
  def current_price
    products.sum { |product| (product.volume * 1.5) + (product.weight * 0.5) } * path_lenght / 100.0
  end

  def deliver_time
    (path_lenght / 80.0) + (path_lenght / 300.0)
  end
end

plain_deliver = PlainDeliver.new(1000)
train_deliver = TrainDeliver.new(8000)
standart_product = Product.new(100, 20)