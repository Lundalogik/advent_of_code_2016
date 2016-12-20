def decrypt(room)
  alphabet = ('a'..'z').to_a

  super_secret = room.split('-')
  letters = super_secret[0, super_secret.length - 1].join(" ")
  sector_id = super_secret[super_secret.length - 1]

  decrypted_letters = ""

  letters.each_char do |char|
    if alphabet.include? char
      char_index = alphabet.index(char)
      char_index += sector_id.to_i
      char_index = char_index % alphabet.length
      char = alphabet[char_index]
    else
      char = " "
    end

    decrypted_letters += char
  end

  if decrypted_letters == 'northpole object storage'
    puts sector_id
  end

end

list = File.readlines('day4_input.txt')
list = list.map do |x|
  x.strip
end

correct_rooms = []

list.each do |x|
  super_secret = x.split('-')
  sector_id, checksum = super_secret[super_secret.length - 1].split('[')
  checksum = checksum.gsub(/\]/m, '')

  letters = super_secret[0, super_secret.length - 1].join(" ").gsub(/\s/m, '')

  counts = Hash.new 0

  letters.each_char do |char|
    counts[char] += 1
  end

  correct_checksum = ""

  counts = counts.sort_by {|k, v| [-v, k]}
  counts[0,5].each do |char|
    correct_checksum += char[0]
  end

  if correct_checksum == checksum
    correct_rooms << x.split('[')[0]
  end
end

correct_rooms.each do |x|
  decrypt(x)
end
