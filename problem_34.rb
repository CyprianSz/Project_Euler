=begin
  
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
  
=end

class SumOfFactorials
  def initialize(up,to)
    @up = up
    @to = to
    checking
  end

  def factorial(n)
    # simple method for factorial of n
    (1..n).reduce(1,:*)
  end

  private

  def checking
    # creates an up - to array from which it selects searched numbers
    numbers = (@up..@to).to_a.select { |i| i.to_s.chars.map(&:to_i).map! { |i| factorial(i) }.reduce(:+) == i }
    # puts searched sum of numbers
    p numbers.reduce(:+)
  end
end

start_time = Time.now
# 'up' is 3 couse we exclude 1 and 2 as they are not sums
# 'to' is 2540160 because it's equal to 9!*9!*9!*9!*9!*9!*9!. It's the biggest pissible number 
# Becouse of fact, if we take 8-diggit number: maximum made from 9!*8 is stil 7-digit number so its impossible to fit
SumOfFactorials.new(3, 2540160)

p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"