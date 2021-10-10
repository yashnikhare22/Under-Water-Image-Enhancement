clc;
clear;
close;
% Read the image 
a=imread('sample_1.jpg');

% Convert to grayscale incase it is color
a = rgb2gray(a);
b=size(a);
a=double(a);

% Loop for Getting the Histogram of the image
hist1 = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if a(i,j)==k
                hist1(k+1)=hist1(k+1)+1;
            end
        end
    end
end

%Generating PDF out of histogram by diving by total no. of pixels
pdf=(1/(b(1)*b(2)))*hist1;

%Generating CDF out of PDF
cdf = zeros(1,256);
cdf(1)=pdf(1);
for i=2:256
    
    cdf(i)=cdf(i-1)+pdf(i);
end
cdf = round(255*cdf);

ep = zeros(b);
for i=1:b(1)                                        %loop tracing the rows of image
    for j=1:b(2)                                    %loop tracing thes columns of image
        t=(a(i,j)+1);                               %pixel values in image
        ep(i,j)=cdf(t);                             %Making the ouput image using cdf as the transformation function
    end                                             
end

% Loop for Getting the Histogram of the image
hist2 = zeros(1,256);
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if ep(i,j)==k
                hist2(k+1)=hist2(k+1)+1;
            end
        end
    end
end

subplot(2,2,1);
imshow(uint8(a));
subplot(2,2,3);
imshow(uint8(ep));
subplot(2,2,2);
stem(hist1);
subplot(2,2,4);
stem(hist2);