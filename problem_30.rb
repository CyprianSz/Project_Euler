=begin
  
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
  
=end

class SumOfDigits
  def initialize(up,to,power)
    @up = up
    @to = to
    @power = power
    checking
  end

  private

  def checking
    #creates an up - to array from which it selects searched numbers
    numbers = (@up..@to).to_a.select {|i| i.to_s.chars.map(&:to_i).map! {|i| i**@power}.reduce(:+) == i }
    # puts searched sum of numbers
    p numbers.reduce(:+)
  end
end

start_time = Time.now
# 'up' is 2 couse we exclude 1 as it is not a sum 
# 'to' is 354294 because it's equal to 9**5*6. It's the biggest pissible number, becouse if we take 7 diggits number, 
# minimum is a milion and maximum (made of nines powers) is 413343, so its impossible to be equal.
SumOfDigits.new(2,354294,5) 
p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"