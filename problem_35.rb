=begin

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

=end

class CircularPrimes
	require 'prime'
	def initialize(range) 
		@range = range
		checking
	end

	private

	def checking
		# start an answers array with 5, couse we exclude all numbers containing it to speed up counting, but the 5 itself is a circular prime
		answers = [5]
		# excluding primes which contains 0, 2, 4, 5, 6 or 8, as there is no possibility for them to be circular.
		selected_primes = Prime.each(@range).to_a.select { |i| (i.to_s.chars & ["0", "2", "4", "5", "6", "8"]).empty? }
		selected_primes.each do |i|
			n = i
			counter = 0
			# this "|| answers.include?(n)" should be added to count normal circular primes
			# defined fe. here: https://en.wikipedia.org/wiki/Circular_prime
			# but Project_Euler have different requirements (counts more numbers as circular primes)
			# so i excluded this part. There is also no need to use uniq! method then.
			until !n.prime? || counter == n.to_s.length #|| answers.include?(n)
				n = n.to_s.insert(-1,n.to_s[0])[1..n.to_s.length].to_i
				counter += 1
				answers << i if n == i
			end
		end
		p answers.uniq!.length
	end
end

start_time = Time.now

CircularPrimes.new(1_000_000)

p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"