require 'faker'
require 'pry'

module Quotable
  def click
    puts Faker::Quote.famous_last_words
    super
  end
end

class Clicker
  CLICKS_TO_REACH_NEW_LEVEL = 5
  POINTS_KEY = :points
  LEVEL_KEY =  :level
  CLICKS_KEY = :clicks

  attr_reader :user_id, :user_info

  def initialize(user_id)
    @user_id = user_id
    @@clicks ||= Hash.new { |h, k| h[k] = { POINTS_KEY => 0, LEVEL_KEY => 0, CLICKS_KEY => 0 } }
    @user_info = @@clicks[user_id]
  end

  def click
    user_info[CLICKS_KEY] += 1
    update_level
    add_points
  end

  def clicks_amount
    user_info[CLICKS_KEY]
  end

  def level
    user_info[LEVEL_KEY]
  end

  def points
    user_info[POINTS_KEY]
  end

  private

  def update_level
    return unless user_info[CLICKS_KEY] % CLICKS_TO_REACH_NEW_LEVEL == 0

    user_info[LEVEL_KEY] += 1
  end

  def add_points
    user_info[POINTS_KEY] += income_per_click
  end

  def income_per_click
    level + 1
  end
end

c = Clicker.new(11)
binding.pry
