=begin
	
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
	
=end


require 'prime'
primes = Prime.each(1000000).to_a
longest = []
primes[0..10].each_with_index { |p, i|
  j = i
  begin
    j += 1
    cons = primes[i..j]
    sum = cons.reduce(:+)
    if sum.prime? && cons.length > longest.length
      longest = cons
    end
  end while sum < 1000000
}
puts longest.reduce(:+)