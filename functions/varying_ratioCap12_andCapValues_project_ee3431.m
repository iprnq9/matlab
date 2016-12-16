clc; clear all; close all;

j = sqrt(-1);

C1 = [1e-9 1e-8 1e-7 1e-6 1e-5 1e-4 1e-3];
C2 = [1e-9 1e-8 1e-7 1e-6 1e-5 1e-4 1e-3];

ratio_Cap12 = [0.01 0.1 0.2 0.5 1 2 4 10 20 50 100];

figure();
counter = 0;
for m=C2
    for k=C1
        for r=ratio_Cap12
            k = r*k;
            m = m/r;
            fh = 10000;
            fl = 1000;
            BW_w = fh-fl;
            fo_w = 5500;
            wo_w = fo_w*2*pi;

            R2 = 1.*sqrt(1./(wo_w.^2*k.*m)); %changing the ratio between R2 and R4 adjusts the center frequency
            R4 = 1*R2;
            R3 = sqrt((wo_w./(BW_w)).^2.*(m./k).*R2.*R4);
            R1 = R3;
            R5 = 10;
            R6 = 1000;

            wo = 1/sqrt(R2*R4*k*m);
            fo = wo/(2*pi);
            Q = sqrt((k*R3^2)/(R2*R4*m));
            BW = wo/Q;
            gain = -R3/R1;

            f = 0:10:50e3;

            H = gain.*(wo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*wo./Q + wo.^2);
            plot(f,abs(H)); hold on; pause(0.01); drawnow();
            counter = counter+1;
            grid on; title(counter);
            xlim([0 11000]);
            ylim([0 1]);
        end;
    end;
end;