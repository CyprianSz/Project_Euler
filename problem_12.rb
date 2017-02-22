def triangular_number(x)
  (1..x).reduce(:+)
end

def check(x)
  n = 1
  n += 1 until factors(triangular_number(n)) > x 
  return triangular_number(n)
end

def factors(x)
  m = Math.sqrt(x) 
  2 * 1.upto(m).count { |i| (x % i).zero? } - ((x == m * m) ? 1 : 0)
end   

p check(500)