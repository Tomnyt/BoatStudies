import cv2 as cv
import torch
import numpy

img = cv.imread('Tomy.jpg', -1)

timg = torch.tensor(img)

print(timg)
print(f'tensor shape: {timg.shape}')
print(f'tensor shape: {img.shape}')
cv.imshow('Me', img)

cv.waitKey(0)
cv.destroyAllWindows()