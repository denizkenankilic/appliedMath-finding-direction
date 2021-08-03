
%im=imread('Koreasat_1.jpg');
%im=imread('TDRS_4.jpg');
im=imread('gps_1.jpg');
[height, width] = size(im);
if width > height
	buf = (width - height) / 2;
	im=im(:, buf+1:width-buf);
else
	buf = (height - width) / 2;
	im=im(buf+1:height-buf, :);
end
[height, width] = size(im);
im = double(im);
im = im - mean(im(:));
load hp.txt;
fim = filter2(hp, im, 'same');

ac = autocorr2d(fim);

[igrid, jgrid] = meshgrid(-width/2:width/2-1, -height/2:height/2-1);
%cii = mean(mean(igrid .* igrid .* ac));
%cjj = mean(mean(jgrid .* jgrid .* ac));
%cij = mean(mean(igrid .* jgrid .* ac));

ar = 18;
msk = zeros(size(igrid));
msk(height/2+1-ar:height/2+1+ar, width/2+1-ar:width/2+1+ar) = 1;
cii = sum(sum(igrid .* igrid .* ac .* msk)) / (ar*ar);
cjj = sum(sum(jgrid .* jgrid .* ac .* msk)) / (ar*ar);
cij = sum(sum(igrid .* jgrid .* ac .* msk)) / (ar*ar);

cm = [cii cij; cij cjj];

[evec, eval] = eig(cm);
drc = evec(1, :);
drc = (width/2.1) * drc / norm(drc);

figure(1)
imagesc(ac)
axis equal
hold on
quiver(width/2, height/2, -drc(2), drc(1), 'r')
hold off
