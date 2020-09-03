class ArabicNumber
  @@specialValues = {
    1 => "I",
    5 => "V",
    10 => "X",
    50 => "L",
    100 => "C",
    500 => "D",
    1000 => "M"
  }
  @@valueIncrements = [
    1,
    5,
    10,
    50,
    100,
    500,
    1000
  ]

  def getDigits(number)
    if (number <= 0 || number >= 4000)
      raise RangeError, 'Argument is greater than or equal to zero, or the value is 4000 or greater'
    end
    number.to_s.chars.map(&:to_i)
  end

  def findSubValues(values)
    indexer = values.length() - 1
    subValues = []
    values.each { |item|
      subValues << item.to_s.concat("0" * indexer).to_i
      indexer -= 1
    } 
    result = subValues.select do |elem|
      elem != 0
    end
    return result
  end

  def swapArabicForRoman(subValues)
    revisedPlacement = @@valueIncrements
    romanString = ""
    subValues.each { |item|
      if (@@specialValues.key?(item))
        romanString.concat(@@specialValues[item])
      elsif (item > 1000)
        romanString.concat(@@specialValues[1000] * (item / 1000))
      elsif (subValues.index(item) == subValues.length() - 1)
        if (item < 4)
          romanString.concat(@@specialValues[1] * item)
        elsif (item == 4)
          romanString.concat(@@specialValues[1])
          romanString.concat(@@specialValues[5])
        elsif (item > 5 && item < 9)
          romanString.concat(@@specialValues[5])
          romanString.concat(@@specialValues[1] * (item - 5))
        elsif (item == 9) 
          romanString.concat(@@specialValues[1])
          romanString.concat(@@specialValues[10])
        end
      else
        revisedPlacement << item
        revisedPlacement.sort!
        previousSlot = revisedPlacement.index(item) - 1
        nextSlot = revisedPlacement.index(item) + 1
        if (item == revisedPlacement[nextSlot] - revisedPlacement[previousSlot])
          romanString.concat(@@specialValues[revisedPlacement[previousSlot]])
          romanString.concat(@@specialValues[revisedPlacement[nextSlot]])
        elsif (item == revisedPlacement[nextSlot] - revisedPlacement[previousSlot - 1])
          romanString.concat(@@specialValues[revisedPlacement[previousSlot - 1]])
          romanString.concat(@@specialValues[revisedPlacement[nextSlot]])
        else
          twoSlotsPrior = previousSlot - 1
          difference =  item - revisedPlacement[previousSlot]
          stages =  revisedPlacement[twoSlotsPrior]
          multiplier =  difference / stages
          romanString.concat(@@specialValues[revisedPlacement[previousSlot]])
          romanString.concat(@@specialValues[revisedPlacement[twoSlotsPrior]] * multiplier)
        end
      end
      revisedPlacement = @@valueIncrements
    } 
    return romanString
  end
end
