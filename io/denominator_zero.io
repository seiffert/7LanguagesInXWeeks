
Number oldDivide := Number getSlot ("/")
Number / := method (otherNum, if (0 == otherNum, 0, self oldDivide(otherNum)))

(16 / 0) println
(16 / 4) println