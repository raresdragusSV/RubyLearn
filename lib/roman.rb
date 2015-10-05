require_relative 'roman_arabic'

class Roman

  def self.convert(roman)
    arabic = 0
    until roman.empty?
      RomanArabic::ROMANS.each { |key, value|
        # we generally use do...end for multiline blocks
        # and use {...} for one-liners
        if roman.start_with? key
          arabic += value
          roman.slice!(0,key.size)
          break
          # This method works great, but it performs a lot of unnecessary
          # comparisons, like checking for M's even when at the end of the
          # conversion.
          # Optional Challenge: come up with a better formula, one that avoids
          # using break. Hint: try converting from the other end of the number
        end
      }
    end
    return arabic
  end
end
