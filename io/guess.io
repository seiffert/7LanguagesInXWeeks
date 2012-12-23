
stdin := File standardInput

random := Random value(1, 100) floor

random println

10 repeat(
    "Please make your guess..." println
     
    guess := stdin readLine asNumber
    
    if (guess == random,
        "Congratulations!" println; break,
        "Try again..."
    )
)
