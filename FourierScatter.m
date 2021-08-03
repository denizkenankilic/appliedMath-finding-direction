im=imread('gps_1.jpg');
fim=fft2(im);
fims=fftshift(fim);
figure(1)
imagesc(abs(fims))
figure(2)
imagesc(log(abs(fims)+1))
x1 = ifft2((abs(fim).^2));
x1(1:5,1:5)
x2=abs(x1);
x2(1:5,1:5)
figure(3)
imagesc(x2)


fim=fft2(im);
fims=fftshift(fim);
imagesc(log(abs(fims)+1))
figure(4)
imagesc(im)
figure(5)
imagesc(log(abs(fims)+1))
max(abs(fims(:)))
min(abs(fims(:)))
figure(6)
imagesc(log(abs(fims)+1))
figure(7)
colormap jet
imagesc(im)
fim=fft2(im);
sfim=fftshift(fim);
help fftshift
figure(8)
imagesc(log(abs(sfim)+1))
afim=abs(sfim);
hist(afim(:), 100)
%fim=fft2(double(im));
fim=fft2(double(im(:,:,1)));
sfim=fftshift(fim);
figure(9)
imagesc(log(abs(sfim)+1))
figure(10)
imagesc(im)