=begin

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

=end

class AddingDiagonals
  def initialize(side_size)
    @side_size = side_size
    counting
  end

  private

  def counting
    numbers = [1]
    n = 0
    while n < @side_size - 2
      (0+2*n..3+2*n).each {|i| numbers.push(numbers[i] + 2 + n) }
      n += 2
    end
    p numbers.reduce(:+)
  end
end

start_time = Time.now
AddingDiagonals.new(1001)
p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"