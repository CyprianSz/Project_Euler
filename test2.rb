
start_time = Time.now

class Integer
  def length
    Math.log10(self).to_i + 1
  end

  def rotations
    1.upto(length).map { |a| to_s.chars.rotate(a) }.map! { |a| a.join.to_i }
  end
end

def primes(count)
  h = {}
  2.upto(count) { |k| h[k] = 1 }
  2.upto(count) do |k|
    c = k + k
    while c <= count
      h.delete(c)
      c += k
    end
  end
  h
end

h, c = primes(1_000_000), 0
h.each do |k, _|
  c += 1 if k.rotations.reduce(0) { |a, e| a += h.key?(e) ? 1 : 0 } == k.length
end
puts c
end_time = Time.now
p "Time elapsed: #{(end_time - start_time)*1000} milliseconds"