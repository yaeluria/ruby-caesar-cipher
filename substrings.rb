def substrings(string, substrings)
  string.downcase!
  substrings.each_with_object({}) do |substring, occurrences_count_by_substring|
    substring_occurrences = string.scan(/#{substring.downcase}/).length
    substring_occurrences.positive? && occurrences_count_by_substring[substring] = substring_occurrences
  end
end

# substrings = %w[below down go going horn how howdy it i low own part partner sit]
# p substrings("Howdy partner, sit down! How's it going?", substrings)
