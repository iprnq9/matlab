j = sqrt(-1);

t = 0:.001:10;

x = 4*exp(j*2*pi*t);
z = 4*exp(j*2*pi*(t-1.25));

y = 0.5*(x + z);

plot(t,x); hold on;
plot(t,z); hold on;
plot(t,y);
legend('x','z','y');