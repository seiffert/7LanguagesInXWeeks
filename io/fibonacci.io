FibonacciSequence := Object clone

FibonacciSequence cache := List clone

FibonacciSequence simple := method (num,
        if (num <= 2, 
            1,
            self calc(num)
        )
    )
    
FibonacciSequence calc := method (num,    
        if (self cached (num),
            self cached (num),
            doCache(num, self simple (num-1) + self simple (num-2))
        )
    )
    
FibonacciSequence cached := method (num,
        self cache at(num)
    )
    
FibonacciSequence doCache := method (num, result, 
        if (self cache at(num),
            self cache atPut(num, result),
            self cache append(result)
        );
        result
    )

for (i, 1, 100,
    FibonacciSequence simple (i) println
)