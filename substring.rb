
def substrings(string, dictionary)
    string = string.downcase.split(" ")
    output = Hash.new(0)
    string.reduce(Hash.new(0)) do |result, word|
      dictionary.each do |index|
        result[index] += 1 if word.include?(index)
      end
      output = result
    end
    puts output
    
  end
  
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  
  substrings("Howdy partner, sit down! How's it going?", dictionary)