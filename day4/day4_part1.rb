file_path = File.expand_path("../input.txt", __FILE__)
input = File.read(file_path)

def valid?(passphrase)
  passphrase.split(' ') == passphrase.split(' ').uniq
end

p input.split("\n")
  .select { |passphrase| valid?(passphrase) }
  .length
