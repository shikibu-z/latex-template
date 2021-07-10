clear all; close all; clc;
load Testdata

L = 15; % spatial domain
n = 64; % Fourier modes
x2 = linspace(-L,L,n+1); x = x2(1:n); y = x; z = x;
k = (2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; ks = fftshift(k);

[X,Y,Z] = meshgrid(x,y,z);
[Kx,Ky,Kz] = meshgrid(ks,ks,ks);

for j = 1:20
    Un = reshape(Undata(j,:),n,n,n);
    close all, isosurface(X,Y,Z,abs(Un),0.4)
    axis([-20 20 -20 20 -20 20]), grid on, drawnow
    pause(1)
end
