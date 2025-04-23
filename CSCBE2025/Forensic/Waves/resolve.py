import jpegio as jio
import numpy as np
import matplotlib.pyplot as plt

jpeg = jio.read("waves.jpg")
coeffs = jpeg.coef_arrays[0]

plt.figure(figsize=(12,8))
plt.imshow(np.log(np.abs(coeffs) + 1), cmap="gray")
plt.colorbar()
plt.title("DCT Coefficients Visualization (Logarithmic Scale)")
plt.show()