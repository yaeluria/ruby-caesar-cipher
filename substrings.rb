def substrings(string, substrings)
  string.downcase!
  substrings.map(&:downcase).each_with_object({}) do |substring, occurrences_count_by_substring|
    substring_occurrences = string.scan(/#{substring}/).length
    occurrences_count_by_substring[substring] = substring_occurrences if substring_occurrences.positive?
  end
end

# substrings = %w[below down go going horn how howdy it i low own part partner sit]
# p substrings("Howdy partner, sit down! How's it going?", substrings)
