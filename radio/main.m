d0=1;%  Reference distance (meters)
f=28*1e9;% Frequency (Hz)
c=3*1e8;% Speed of light (m/s)
lambda=c/f;% Wavelength (meters)
% Calculate the path loss at reference distance (Lp(d0)) in dB
Lp(d0)=(4*pi*d0/lambda)^2;
Lpd0_db=10*log10(Lp(d0));
% Load LOS and NLOS
[LOS,NLOS]=values();
n=length(LOS);
m=length(NLOS);
% Fill the 5th column of the LOS matrix with Lpd0_db-Lpd
for i=1:n
    LOS(i,5)=Lpd0_db-LOS(i,3);
end
% Calculate the propagation exponent (alpha) and the standard deviation (sigma) for LOS 
disp(" propagation exponent of the path loss model is :  ")
alpha_LOS=calcul_alpha(LOS,d0,n)
disp("the standard deviation considering the LoS environment is: ")
sigma_LOS=calcul_deviation(LOS,d0,alpha_LOS,n)
% Fill the 5th column of the NLOS matrix with Lpd0_db-Lpd
for i=1:m
   NLOS(i,5)=Lpd0_db-NLOS(i,3);
end
% Calculate the propagation exponent (alpha) and standard deviation (sigma) for NLOS
disp(" propagation exponent using data set from NLoS propagation environment is :  ")
alpha_NLOS=calcul_alpha(NLOS,d0,m)
disp("the standard deviation  using data set from NLoS propagation environment is: ")
sigma_NLOS=calcul_deviation(NLOS,d0,alpha_NLOS,m)

% Combine LOS and NLOS data into a single matrix C
C=zeros(48,5);
C(1:10,:)=LOS;
C(11:48,:)=NLOS;
p=length(C);
% Calculate the propagation exponent (alpha) and standard deviation (sigma) for combined data
disp(" propagation exponent using data set from NLoS and LOS propagation environment is :  ")
alpha=calcul_alpha(C,d0,p)
disp("the standard deviation  using data set from NLoS and LOS propagation environment is: ")
sigma=calcul_deviation(C,d0,alpha_NLOS,p)
d_db=10*log10(C(:,3));
% Plot receiver power as a function of Tx-Rx separation distance
figure
plot(d_db,C(:,5))
xlabel("Tx-Rx separation (dB)")
ylabel("receiver power (dB)")
grid on
% Plot path loss as a function of Tx-Rx separation distance
figure;
plot(C(:,3),d_db)
xlabel("Tx-Rx separation (dB)")
ylabel("path loss Lp (dB)")
% Plot probability density function (PDF) of Prx
grid on
prx=(-200:400);
Pprx=1/(sqrt(2*pi)*sigma)*exp(-(prx-10*alpha*log10(20/d0)).^2/(2*sigma^2));
plot(prx,Pprx)
title("probability density function (PDF)")
xlabel("prx")
ylabel("Pprx")
% Plot Lp as a function of D 
figure;
scatter(C(:,4), C(:,3), 'bo');
xlabel('Distance Tx-Rx (m)');
ylabel('Path Loss Lp (dB)');
title('Path Loss as a Function of Distance');
grid on;

