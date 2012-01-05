fov = [180/512 256/512];

nTests=2;
t=zeros(1,nTests);
k=5;
sep=0.41;
l=5;
weights=[0.0448,0.2856,0.3001,0.2363,0.1333];

fName ='Cameraman.BMP';
image1= imread(fName);
fName2 = 'Cameraman_MS0.BMP';
image2=imread(fName2);

imgSize=size(image1);

iCase = 1;
refs={ double(image1) };
tests={ double(image2) };
test=tests{1};
ref=refs{1};

whos test
whos ref

display fssim
tic
[q ,Qarray,debug_data_m]=fssim(test,ref,struct('fovea',fov.*imgSize));

figure(1)
imagesc([Qarray.*255])
colormap gray
colorbar
axis off
axis square


figure(2)
imagesc([ debug_data_m{4}(6:507,6:507) ])
colormap gray
colorbar

% stack image levels together
sz=502;
a=zeros(sz*5,sz);
b=zeros(sz*5,sz);
c=zeros(sz*5,sz);
for i=1:5
    a(1+(i-1)*sz:i*sz,:)=[debug_data_m{1}{i}];
    b(1+(i-1)*sz:i*sz,:)=[debug_data_m{2}{i}];
    c(1+(i-1)*sz:i*sz,:)=[debug_data_m{3}{i}];
end
figure(3)
imagesc(a)
colormap gray
colorbar
axis off
axis square
figure(4)
imagesc(b)
colormap gray
colorbar
axis off
axis square
figure(5)
imagesc(c)
colormap gray
colorbar
axis off
axis square


