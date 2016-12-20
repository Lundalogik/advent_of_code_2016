require 'digest'

def get_hex(hash)
  md5 = Digest::MD5.new
  md5.update hash
  hex = md5.hexdigest
end

input = 'cxdnnyjw'
idx = 0

password = ""
begin
  hash = input + idx.to_s
  hex = get_hex hash

  if hex[0,5] == '00000'
    puts hex[5]
    password += hex[5]
  end

  idx += 1
end while password.length < 8

puts password


