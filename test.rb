class	SelfPowers
	def initialize(limes)
		@limes = limes
		counting
	end

	def counting
		sum = 0
		1.upto(@limes) {|i| sum += i**i}
		puts sum
	end
end

start_time = Time.now
SelfPowers.new(1000).to_s[-3..]
p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"