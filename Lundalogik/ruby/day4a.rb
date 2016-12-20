alphabet = ('a'..'z').to_a

list = File.readlines('day4_input.txt')
list = list.map do |x|
  x.strip
end

list = list.map do |x|
  x.split('-')
end

sum_of_sector_ids = 0

list.each do |x|
  sector_id, checksum = x[x.length - 1].split('[')
  checksum = checksum.gsub(/\]/m, '')

  letters = x[0, x.length - 1].join(" ").gsub(/\s/m, '')

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
    sum_of_sector_ids += sector_id.to_i
  end
end

puts sum_of_sector_ids
