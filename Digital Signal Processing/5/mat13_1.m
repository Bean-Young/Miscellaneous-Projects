clc;clear;close all;
N=input('滤波器长度 N=? ');
n=0:N-1;a=(N-1)/2;Wc=pi/4;
k=n-a;k=k+(k==0)*eps;
hd=(-1).^n.*sin(k*Wc)./(k*pi);
Wr=ones(1,N);
Whn=0.5*(1-cos(2*pi*n/(N-1)));
h1=hd.*Wr;
h2=hd.*Whn;
[H1,w]=freqz(h1,1,1000);
[H2,w]=freqz(h2,1,1000);
mag1=abs(H1);db=20*log10(mag1/max(mag1));
mag2=abs(H2);db=20*log10(mag2/max(mag2));
figure(1);subplot(2,1,1);
stem(k,h1);
xlabel('n');ylabel('h(n)');grid on;
subplot(2,1,2);
plot(w/pi,mag1,'-k');
xlabel('\omega/\pi');ylabel('幅度(dB)');grid on;
figure(2);subplot(2,1,1);
stem(k,h2);
xlabel('n');ylabel('h(n)');grid on;
subplot(2,1,2);
plot(w/pi,mag2,'-k');
xlabel('\omega/\pi');ylabel('幅度(dB)');grid on;