=begin
	
A perfect number is a number for which the sum of its proper divisors is 
exactly equal to the number. For example, the sum of the proper divisors
 of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less 
than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number
that can be written as the sum of two abundant numbers is 24. By mathematical 
analysis, it can be shown that all integers greater than 28123 can be written 
as the sum of two abundant numbers. However, this upper limit cannot be reduced 
any further by analysis even though it is known that the greatest number that 
cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of 
two abundant numbers.
	
=end

class Fixnum
	# What is the sum of divisors:
	def sum_of_divisors
		sum = 0
    	1.upto(Math.sqrt(self)) do |x|
    		if self % x == 0
    			sum += x
    			if x != self / x && x != 1
    				sum += self / x
    			end
    		end
  		end
		sum
	end
	# If numbrer is abundant:
	def abundant?
		self.sum_of_divisors > self
	end
end

class SumFinder
  # Initialize is a method for new class which start after 
  # making new instance fe. SumFinder.new(range)
  def initialize(range)
    # Change input range for @range - which is instance variable, what makes it 
    # the same for all methods in instance of the Class. 
    @range = range 
    # Abundants number in given range:
    @abundants = (1..@range).select { |n| n.abundant? }
    check_abundant_sum
  end
  # Private Makes this method below available to call only from class SumFinder. 
  # Fe. if i would've written this before abundant? in Fixnum class it would be 
  # impossible to call it from method 'initialize' in Class 'SumFinder'
  private 

  def check_abundant_sum
    # Array to store number possible to make by adding two abundant numbers:
    possible_sums = Array.new
    # Searching for numbers which fits to possible_numbers:
    i = 0
    @abundants.each do |x|
    	@abundants[i..@abundants.length].each do |y|
    		sum = x + y
    		possible_sums << sum unless sum > @range
    	end
      i += 1
    end
    # Take rid of same results:
    possible_sums.uniq!
    # Puts final answer:
    puts (0..@range).reject { |n| possible_sums.include? n }.reduce(:+)
  end
end


start_time = Time.now
SumFinder.new(28123)
p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"


