
Object squareBrackets := method(
    l := List clone
    call message arguments foreach(elm,
        if (elm type == "Message",
            elm = doMessage(elm)
        )
    
        l append(elm)
    )
)

List squareBrackets := method(index,
    at(index)
)

l := [1,2,3, "test", "test2", [1,2,3]]
l println

l[2] println