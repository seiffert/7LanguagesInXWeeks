
List myAverage := method(
        num := 0
        sum := 0
        self foreach (elm,
            if ("Number" == elm type,
                sum = sum + elm; num = num + 1,
                Exception raise("List contains non-numeric values"))
        );
        if (0 == num, 0, sum / num)
    );
    
l0 := List clone

l0 myAverage println
    
l1 := List clone
l1 append(1)
l1 append(2)
l1 append(3)
l1 append(4)

l1 myAverage println

l2 := List clone
l2 append("test")
l2 append(3)

l2 myAverage println