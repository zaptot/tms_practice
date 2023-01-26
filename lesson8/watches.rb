require 'pry'

class Device
  attr_reader :owner, :model_name

  def initialize(params)
    @owner = params[:owner]
    @model_name = params[:model_name]
  end
end

class MechanicalDevice < Device
  def work
    raise NotImplementedError
  end
end

module Cleanable
  TIME_TO_BECOME_DIRTY = 5

  def clean
    if @last_cleaned_at.nil? || Time.now - @last_cleaned_at > TIME_TO_BECOME_DIRTY
      @last_cleaned_at = Time.now
      puts 'Ваш девайс почищен'
    else
      puts 'Ваш девайс уже чистый'
    end
  end
end

module WorkableWithMoreComments
  def work
    start_work_time = Time.now
    work_result = super
    puts "Я закончил работать и проработал #{Time.now - start_work_time} секунд"
    work_result
  end
end

class Watches < MechanicalDevice
  include Cleanable
  prepend WorkableWithMoreComments

  MAX_ENERGY = 100
  WORK_ENERGY_INCREASE = 5
  WORK_ENERGY_DECREASE = 1

  def initialize(params)
    @energy = params[:energy]
    super
  end

  def work
    sleep 1
    @energy = [@energy + WORK_ENERGY_INCREASE, MAX_ENERGY].min
  end

  def show_time
    if @energy.positive?
      @energy -= WORK_ENERGY_DECREASE
      Time.now
    else
      puts 'Недостаточно заряда!'
    end
  end
end

binding.pry