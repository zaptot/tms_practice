class TimeLogger
  def self.call
    start_time = Time.current
    res = yield
    puts "#{Time.current - start_time} secs"
    res
  end
end
