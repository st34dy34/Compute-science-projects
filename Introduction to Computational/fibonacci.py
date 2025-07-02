def fib(n):
    if n == 0 or n == 1:
        return 1
    else:
        return fib(n-1) + fib(n-2)
      
def fibBetter(n, memo={}):
    if n == 0 or n == 1:
        return 1
    try:
        return memo[n]
    except KeyError:
        result = fibBetter(n-1, memo) + fibBetter(n-2,memo)
        memo[n] = result
        return result
        
for i in range (500):
    print('fib better(' + str(i) + ')=', fibBetter(i))     
    
for i in range (50):
    print('fib(' + str(i) + ')=', fib(i))
    
    