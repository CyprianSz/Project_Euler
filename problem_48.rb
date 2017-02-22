=begin 

The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

=end

class SelfPowers
  def initialize(range,last)
    @range = range
    @last = last
    counting
  end

  def counting
    sum = 0
    1.upto(@range) {|i| sum += i**i}
    puts sum.to_s[-@last..-1]
  end
end

start_time = Time.now
SelfPowers.new(1000,10)
p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"