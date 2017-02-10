
% Ian Roberts
% Missouri University of Science and Technology
% Department of Electrical and Computer Engineering
% Control Systems Laboratory (EE 3321)
% Experiment 1: Matlab Structure and Use
% Due Date: 

clear all; close all; clc;
j = sqrt(-1);

% Part 5
% 1
p = [2 4 10];
part1_answer = roots(p)


% 2
u = [3 7 15];
v = [4 2 0 1];
part2_answer = conv(u,v)
part2_answer = conv(v,u)


% 3
x = 'We learn to use MATLAB in EE 3321 Laboratory';
part3_answer = x([17:22 34:44])


% 4
a = [1.5 3.3; 6.0 -4.5; -2.5 0.7];
b = [0.5 0.3; -0.1 0.2; 0.4 -0.3];
c = [1 2; 1 2];
d = [3.1 1.4 -0.3; -0.5 1.6 0.1];

part4_answer = a - b*(c.^2) + 2*d'

% Not supposed to work due to disagreeing matrix sizes in matrix
% multiplication:
% part4_answer = a' - b'*(c'.^2) + 2*d'


% 5
part5_answer = b(1,2) - c(1,2)*(d(1,2)).^4


% 6
t = 0:0.001:2;
f1 = 10;
f2 = 20;
[part6_answer_1, part6_answer_2, part6_answer_3] = sumsin(t,f1,f2);

figure();
plot(t,part6_answer_1,t,part6_answer_2,t,part6_answer_3);
title('Summation of Two Sinusoids');
ylabel('Amplitude');
xlabel('Time');
legend('s1','s2','s3');


% 7
x = [-3.6 -2.5 -1.4 -1 0 1.4 2.5 3.6];
part7_answer = round(x)
part7_answer = floor(x)
part7_answer = ceil(x)


% 8
t = 0:.1:0.4;
f = 10:5:20;
x = zeros(length(t),length(f));

for m=1:length(t)
    for n=1:length(f)
        x(m,n) = 3.*cos(2*pi*f(n)*t(m)+0.1);
    end;
end;

part8_answer = x

clear all;

% 9
t = 0:0.01:50;
w = 35:5:45;
max_val = t(1);
m=1;
while m <= length(t)
    n=1;
    while n <= length(w)
        if (t(m)^3 < 10 && exp(1.2)*cos(w(n).*t(m)) < 10)
            if t(m) > max_val
                max_val = t(m);
            end
        end
        n=n+1;
    end
    m=m+1;
end

part9_answer = max_val


% 10
clear all;
t = 0:0.01:10;
f1 = 0.2;
f2 = 0.425;
[s1 s2 s3] = sumsin(t,f1,f2);
figure();
plot(t,s1); hold on; grid on;
plot(t,s2); hold on;
plot(t,s3);
title('Summing Sinusoids');
xlabel('Time');
ylabel('Amplitude');
legend('s1','s2','s3');