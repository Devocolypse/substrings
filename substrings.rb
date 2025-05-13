# Pseudocode
#
# initialize an empty hash to keep track of substrings found
# split the string into an array of individual words
# 
#   for each word in the array:
#     for each word in the "dictionary" of substrings:
#       if the dictionary word is included in the current array word,
#       increment the count of the substring in the hash
#       
# return the hash of substrings found
def substrings_reduce(string, dictionary)
  chunked = string.split(' ')

  count = dictionary.reduce(Hash.new(0)) do |result, substring|
    chunked.each do |word|
      if word.include?(substring)
        result[substring] += 1
      end
    end
    result
  end

  clean_count = count.delete_if { |key, value| value == 0 }
  clean_count
end