
List sum_rec := method (
        result := 0;
        self foreach (elm,
            if (elm type == "List",
                result = result + elm sum_rec,
                result = result + elm
            );  
        );
        result
    )

l := List clone
l append(1)
l append(2)
l append(3)

l2 := List clone
l2 append(l)
l2 append(l)
l2 append(l)

l2 sum_rec println