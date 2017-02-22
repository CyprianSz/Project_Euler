def number_of_elements(x)
  elements = 1
  until x == 1
    if x.even?
      x = x/2
    else
      x = 3*x + 1
    end
    elements += 1
  end
  return elements
end

def elements_to_number(x)
  hash = Hash.new
  n = 1
  while n < x
    hash[n] = number_of_elements(n)
    n += 1
  end
  return hash.sort_by {|x,y| y}
end

p elements_to_number(1000000)[999998]