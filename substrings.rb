def substrings(string, dictionary)
    count_hash = {}
    dictionary.map {|substring| count_hash[substring] = string.downcase.scan(/#{substring.downcase}/).count }
    count_hash
end

# dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# p substrings("Howdy partner, sit down! How's it going?", dictionary)
