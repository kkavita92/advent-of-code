file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

def convert_to_chars(passphrase)
  passphrase.split(' ').map { |phrase| phrase.chars.sort.join }
end

def unique_array?(passphrase)
  passphrase == passphrase.uniq
end

p input.split("\n")
  .map { |passphrase| convert_to_chars(passphrase) }
  .select { |passphrase_array| unique_array?(passphrase_array) }
  .length
