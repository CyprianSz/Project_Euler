def silnia(x):
    if x==0:
        wynik = 1
    wynik = 1
    for i in range(1,x+1):
        wynik *= i
    return wynik

y = str(silnia(100))
n=0
suma = 0
while n < len(y):
    suma += int(y[n])
    n += 1

print(suma)


