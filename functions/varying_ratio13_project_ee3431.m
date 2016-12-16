clc; clear all; close all;

j = sqrt(-1);

C1 = 0.01e-6;
C2 = C1;

ratio_13 = [0.01 0.02 0.03 0.05 0.1 0.15 0.2 0.35 0.5 0.75 1 2 4 10 20 50 100];

figure(1);

for m=C2
    for k=C1
        for r=ratio_13
            fh = 10000;
            fl = 1000;
            BW_w = fh-fl;
            fo_w = 5500;
            wo_w = fo_w*2*pi;
            Q=0.1;
            R2 = sqrt(1./(wo_w.^2*k.*m));
            R4 = R2;
            R3 = r.*sqrt(((Q)).^2.*(m./k).*R2.*R4);
            R1 = 1/r.*R3;
            R5 = 1000;
            R6 = 1000;

            wo = 1/sqrt(R2*R4*k*m);
            fo = wo/(2*pi);
            Q = sqrt((k*R3^2)/(R2*R4*m))
            BW = wo/Q;
            gain = -R3/R1

            f = 0:10:50e3;

            H = gain.*(wo./Q).*(j.*2.*pi.*f)./((j.*2.*pi.*f).^2 + (j.*2.*pi.*f).*wo./Q + wo.^2);
            loglog(f,abs(H)); hold on; pause(0.4); drawnow();
            grid on;
        end;
    end;
end;

figure(2);

for m=C2
    for k=C1
        for r=ratio_13
            c = [1 (2.*pi.*fo./Q) (2.*pi.*fo).^2];
            c = roots(c);
            plot(real(c),imag(c), 'x'); hold on; drawnow();
            grid on;
            xlim([-4e5 4e5]);
            ylim([-4e5 4e5]);
            title('Pole-Zero Plot');
            xlabel('Real(s)');
            ylabel('Imag(s)');
        end;
    end;
end;
