# frozen_string_literal: true
require_relative './arabic_number'
def fromRoman(romanNumber)
    # Replace the following line with the actual code!
    raise NotImplementedError
end
def toRoman(arabicNumber)
    # Replace the following line with the actual code!
    number = ArabicNumber.new
    splitIntegers = number.getDigits(arabicNumber)
    subGroups = number.findSubValues(splitIntegers)
    return number.swapArabicForRoman(subGroups)
end