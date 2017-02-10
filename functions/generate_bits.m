d = [0 1 1 1 0];

D = [];
k=1:(max(t)*2*fm)

for k=k
    d(k);
    if d(k)
        D = [D ones(1,round(1/T*max(t)/(max(t)/(1/fm)*2)))];
    else
        D = [D zeros(1,round(1/T*max(t)/(max(t)/(1/fm)*2)))];
    end;
end;

D = [D 0];
length(D);
figure();
plot(t,D); grid on;