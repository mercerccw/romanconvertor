class RomanNumber

    @@specialValues = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }

    def convertToArabic(number)
        numberLength = number.length() - 1
        romanNumerals = number.split("")
        arabicNumber = 0
        wasSubtracted = false
        for index in 0..numberLength
            if (@@specialValues[romanNumerals[index]] == nil)
                raise TypeError, 'Invalid roman numeral'
            elsif (index == numberLength && wasSubtracted)
                next
            elsif (index == numberLength && !wasSubtracted)
                arabicNumber += @@specialValues[romanNumerals[index]]
            elsif (@@specialValues[romanNumerals[index]] < @@specialValues[romanNumerals[index + 1]])
                value = @@specialValues[romanNumerals[index + 1]] - @@specialValues[romanNumerals[index]]
                arabicNumber += value
                wasSubtracted = true
            elsif (@@specialValues[romanNumerals[index]] >= @@specialValues[romanNumerals[index + 1]])
                arabicNumber += @@specialValues[romanNumerals[index]]
                wasSubtracted = false
            end
        end
        return arabicNumber
    end

end
  