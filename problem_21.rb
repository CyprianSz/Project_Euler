start_time = Time.now
#what are the proper divisors:
def proper_divisors(n)
		divisors = Array.new
    	1.upto(Math.sqrt(n)) do |x|
    		if n % x == 0
    			divisors << x
    			if x != n / x && x != 1
    				divisors << n / x
    			end
    		end
  		end
  		divisors
	end

#what is the sum of proper divisors:
def d(n)
	proper_divisors(n).reduce(:+)
end

#what are the amicable_numbers:
def amicable_numbers(n)
	numbers = Array.new
	2.upto(n) do |x|
		y = d(x)
		if !numbers.include?(y)
			numbers.push(x,y) if d(y) == x && y != x
		end
	end
	return numbers
end 

#what is the sum of amicable numbers:
def sum_of_amicable_numbers(n)
	amicable_numbers(n).reduce(:+)
end

p sum_of_amicable_numbers(10000)

p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"