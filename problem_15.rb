def factorial(n)
  (1..n).reduce(1, :*)
end

def lattice_paths(x=true)
  puts "What's the side size ?"
  x = gets.chomp.to_i
  puts "There are #{factorial(2*x)/factorial(x)**2} paths."
end

start_time = Time.now
lattice_paths
p "Time elapsed: #{(Time.now - start_time)*1000} milliseconds"