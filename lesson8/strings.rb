module Ridable
  def ride
    puts 'ride'
  end
end

module Relaxable
  def relax
    puts 'relax'
  end
end

class Taxi
  def relax
    puts 'taxi relax'
  end

  protected

  def protected_method
  end

  private

  def private_method
  end
end

Taxi.new.relax

# include, prepend, extend


(1...100)