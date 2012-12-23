Matrix := List clone
Matrix init := method(x, y,
    l := List clone
    
    l asString := method (
        self join(" ")
    )
    for (i, 1, x,
        l append(0)
    )
    for (i, 1, y,
        self append(l clone)
    )
)
Matrix set := method(x, y, value,
    self at(y - 1) atPut(x - 1, value)
)
Matrix get := method(x, y,
    self at(y - 1) at(x - 1)
)
Matrix transpose := method(
    result := dim (self size, self at(0) size)
    for (i, 0, self size - 1,
        for (j, 0, self at(i) size - 1,
            result at(j) atPut(i, self at(i) at(j))
        )
    )
    result
)
Matrix asString := method(
    string := "" asMutable
    self foreach(row, 
        string appendSeq(row asString asString) appendSeq("\n")
    )
    string
)
Matrix writeToFile := method (filename,
    f := File with(filename)
    f openForUpdating
    f write(self asString)
    f close
)

dim := method (x, y,
    l := Matrix clone
    l init(x, y)
)
matrixFromFile := method(filename,

)
    
test := dim(3, 2)
test set(1, 2, 3)
test get(1, 2) println

test println
test transpose println

test writeToFile("matrix.txt")