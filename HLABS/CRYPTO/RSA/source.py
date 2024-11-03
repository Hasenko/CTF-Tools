from Crypto.Util.number import bytes_to_long, long_to_bytes

class RSA():
	def __init__(self,e,p,q):
		self.e = e
		self.p = p 
		self.q = q 
		self.n = self.p*self.q 
		self.phi = (self.p-1)*(self.q-1)
		self.d = pow(self.e,-1,self.phi) 

	def get_publickey(self):
		return (self.e,self.n)

	def get_privatekey(self):
		return (self.d)

	def encrypt(self,message):
		return pow(bytes_to_long(message),self.e,self.n)

	def decrypt(self,message):
		return long_to_bytes(pow(message,self.d,self.n))