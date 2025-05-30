def decrypt(cipher:list, key:int) -> str:
  return ''.join(list(map(lambda x: chr(((x>>4)-key) % 0x10FFFF), cipher)))

wonderland = [cat_4, cat_3, cat_2, cat_1] = [ord('🐰'),  ord('🐇'), ord('🌘'), ((ord('🤴') ^ 0xc0ffee) + ord('🤖') + ((ord('🎪') << 4) | 0x0Ca7)) | 0b1]

secret_key = 0

encrypted_flag = [235191264, 235191216, 235191328, 235191168, 235191568, 235190432, 235191328, 235190384, 235191184, 235190416, 235191120, 235190384, 235191360, 235191120, 235190992, 235190368, 235191360, 235190688, 235190416, 235191424, 235191328, 235190432, 235191360, 235190688, 235191600]
print(decrypt(encrypted_flag, secret_key))

while True:

  a = decrypt(encrypted_flag, secret_key)
  print(a)
  if (a.startswith("helb")): break
  
  secret_key += 1