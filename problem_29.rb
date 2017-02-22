class DistinctPowers
  def initialize(range)
    @range = range
    counting
  end

  def counting
    sequence = Array.new
    2.upto(@range) do |i| 
      2.upto(@range) do |j|
        sequence << i**j
      end
    end
    puts sequence.uniq!.length
  end
end


start_time = Time.now
DistinctPowers.new(100)
p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"