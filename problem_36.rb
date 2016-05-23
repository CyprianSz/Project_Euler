=begin
	
The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
	
=end

class Palindromes
	def initialize(range)
		@range = range
		checking
	end
	
	private
	def checking
		answers = Array.new
		(1...@range).step(2) { |i| answers << i if i.to_s.reverse! == i.to_s && i.to_s(2).reverse! == i.to_s(2) }
		p answers.reduce(:+)
	end
end

start_time = Time.now

Palindromes.new(1_000_000)

p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"