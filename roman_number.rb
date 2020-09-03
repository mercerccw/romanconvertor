class RomanNumber

    @@specialValues = [
        "I",
        "V",
        "X",
        "L",
        "C",
        "D",
        "M"
    ]

    def roman_mapping
        {
          1000 => "M",
          900 => "CM",
          500 => "D",
          400 => "CD",
          100 => "C",
          90 => "XC",
          50 => "L",
          40 => "XL",
          10 => "X",
          9 => "IX",
          5 => "V",
          4 => "IV",
          1 => "I"
        }
    end

    def to_arabic(str = self, result = 0)
    return result if str.empty?
    number = str
    number = number.split("")
    number.each do |numeral|
        validNumeral = @@specialValues.include? numeral
        if !validNumeral
            raise TypeError, "Invalid roman numeral"
        end
    end
    roman_mapping.values.each do |roman|
        if str.start_with?(roman)
            result += roman_mapping.invert[roman]
            str = str.slice(roman.length, str.length)
            return to_arabic(str, result)
        end
    end
    end

end
  