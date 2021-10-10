A = imread('sample_1.jpg');
B = imreducehaze(A);
montage({A,B})
title("Hazy Image (Left) vs. Reduced Haze Image (Right)")