def caesar_cipher(string, key)
    string = string.split("")
    string.map!{|char| cipher(char,key)}
    puts string.join("")  
  end
  
  def cipher(char, key)
    def is_upper?
      self == self.upcase
    end
    
    ciphered_char = char.downcase
    
    if ciphered_char >="a" && ciphered_char <="z"
      ciphered_char = ciphered_char.ord
      shift = ciphered_char + key
  
      while shift >= 122
        shift -=25
      end
      while shift <= 97
        shift +=25
      end
      ciphered_char = shift.chr
      if char.is_upper?
        char = ciphered_char.upcase
      else
        char = ciphered_char
      end
    
    else
      char
    end
  end
  
  #caesar_cipher("Hello Darkness, my old friend!",295)