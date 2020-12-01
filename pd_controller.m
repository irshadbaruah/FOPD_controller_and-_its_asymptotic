clc;
clf;
clear all;
close all;
Kp = 55.7616;
Kd = 0.7836;
beta = 0.9789;
%K= 1.53;
%T = 0.0254;
Wcr = (abs(1/Kd))^(1/beta);
%Wcr1 = (abs(1/0.0254));
w = logspace(-4 , 4, 1000);
mask = w < Wcr;
% mask1 = w < Wcr;
mag1 = 20*log10(Kp)*ones(size(w));
mag2 = 20*log10(Kd)*ones(size(w));
%mag3 = 20*log10(K)*ones(size(w));
mag4 =  mask.*(20*log10(1/Kd)) + (~mask).*(20*beta*log10(w));
%mag5 = -20*log10(w);
%mag6 =  (mask1).*(-20*log10(1)) + (~mask1).*(-20*log10(0.0254*w));
%combined = mag1 + mag2 + mag3 + mag4 + mag5 + mag6 ;
 combined = mag1 + mag2 +  mag4  ;
 

figure(1);
plot(1,1);
semilogx(w, combined,'Color','black')
xlabel('Frequency(rad/sec)');
ylabel('Magnitude dB');
grid on;
legend('Asymptotic magnitude bode plot','Location','NorthEast')
 
 
plot(1,1);
semilogx(w, combined,'Color','black','LineStyle','--')
xlabel('Frequency(rad/sec)','FontSize', 15);
ylabel('Magnitude dB','FontSize', 15);
grid on;
hold on;
 
 
clc;
clear 
% K = 1.53;
Kp = 55.7616;
Kd = 0.7836;
beta = 0.9789;
% T = 0.0254;
 
w=logspace(-4,4,1000);
Mag=@(w) (20*log10(abs(sqrt(Kp).^2)) + 20*log10(abs(sqrt(Kd).^2)) + 20*log10(abs(sqrt((i.*w).^beta + (1/Kd)).^2)));   
semilogx(w,Mag(w) ,'Color','black');
hold on;
grid on;
xlabel('Frequency (rad/sec)');
ylabel('Magnitude (dB)');
legend('Asymptotic magnitude bode plot','Exact magnitude bode plot','Location','NorthEast')


