=begin

The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove 
digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work
from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

=end

class Fixnum
  # checks if number is truncatable
  def truncatable?
    (0..self.to_s.length-1).all? { |i|
    self.to_s[0..i].to_i.prime? && self.to_s[i..-1].to_i.prime?
    }
  end
  # gives a conditions to select only possible primes
  def pretender
    (self.to_s.chars & %w(0 4 6 8)).empty? && \
    !%w(1 9).include?(self.to_s[0]) && \
    !%w(1 2 5 9).include?(self.to_s[-1]) && \
    ![3, 7].include?(self)
  end
end

class TruncatablePrimes
  require 'prime'
  def initialize(number, range)  
    @number = number
    @range = range
    searching
  end
  # creates an array with answers by checking first if number is pretender and if it is
  # checking if it's truncatable. Puts sum of first '@number' numbers. In this case
  # 11 is maximum and it's pointless to put bigger @number (or @range).
  def searching
    answers = Prime.each(@range).to_a.select { |i| i.pretender && i.truncatable? }
    p answers[0...@number].reduce(:+)
  end
end

start_time = Time.now

TruncatablePrimes.new(11, 1_000_000)

p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"