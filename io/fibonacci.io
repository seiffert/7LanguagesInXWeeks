Fibonacci := Object clone

Fibonacci cache := Map clone atPut("0", 1) atPut("1", 1)

Fibonacci at := method (num, cache atIfAbsentPut(num asString, at(num - 1) + at(num - 2)))

for (i, 1, 100,
    Fibonacci at (i) println
)