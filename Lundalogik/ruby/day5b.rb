require 'digest'

def get_hex(hash)
  md5 = Digest::MD5.new
  md5.update hash
  hex = md5.hexdigest
end

input = 'cxdnnyjw'
idx = 0

numbers = ("0".."7").to_a

password = [nil] * 8
begin
  hash = input + idx.to_s
  hex = get_hex hash

  if hex[0,5] == '00000'
    position = hex[5]
    if numbers.include? position and password[position.to_i] == nil
      password[position.to_i] = hex[6]
      puts password.to_s
    end
  end

  idx += 1
end while password.include? nil

puts password.to_s
