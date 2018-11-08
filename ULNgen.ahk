;----OUTPUT NEW VALID NHS NUMBER OR ULN (WIN+N)
#N::
outputNumber := GetRandomValidULN()
SendInput, %outputNumber%
return

;----ULN CREATION (WIN+N) Alternative
GetRandomValidULN()
{
	Random, digit1, 1, 9
	Random, digit2, 0, 9
	Random, digit3, 0, 9
	Random, digit4, 0, 9
	Random, digit5, 0, 9
	Random, digit6, 0, 9
	Random, digit7, 0, 9
	Random, digit8, 0, 9
	Random, digit9, 0, 9

	adjustedDigit1 := digit1*10
	adjustedDigit2 := digit2*9
	adjustedDigit3 := digit3*8
	adjustedDigit4 := digit4*7
	adjustedDigit5 := digit5*6
	adjustedDigit6 := digit6*5
	adjustedDigit7 := digit7*4
	adjustedDigit8 := digit8*3
	adjustedDigit9 := digit9*2

	totalDigit := (adjustedDigit1+adjustedDigit2+adjustedDigit3+adjustedDigit4+adjustedDigit5+adjustedDigit6+adjustedDigit7+adjustedDigit8+adjustedDigit9)

	remainder := 505 - totalDigit
	
	checkDigit := Mod(remainder, 11)
	
	if(checkDigit = 10)
	{
		return GetRandomValidULN()
	}
	if(checkDigit = 11)
	{
		checkDigit := 0
	}
	return digit1 . digit2 . digit3 . digit4 . digit5 . digit6 . digit7 . digit8 . digit9 . checkDigit
	;return checkDigit
}