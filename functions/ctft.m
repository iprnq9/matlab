      function [f,X,N,no]=ctft(t,x,dfm)
%
%     %  ctft.m
%     %   function [f,X,N,no]=ctft(t,x,dfm)
%     %           Computes and plots the Fourier transform of signal
%     %            x(t) extending from t1 to t2  (t1<=0  t2>0).
%     %           dfm=upper limit on transform point spacing
%     %           ns=size(x,2)=number of signal points.
%     %           dt=signal point spacing.
%     %           Transform computed with N points, where N=2*ns or
%     %           N=ceil(1/(dfm*dt)), whichever is larger.
%     %           since N>ns, signal points are zero padded.

%     %  written by Gordon E. Carlson   University of Missouri-Rolla
%     %  modified by Randy H. Moss      University of Missouri-Rolla

        ns=size(x,2);  
        dt=t(2)-t(1);
        N=ceil(1/(dfm*dt));  
        if N<2*ns;  
            N=2*ns;  
        end;  
        df=1/(N*dt);
        xp=zeros(1,N);  
        nns=sum(t<0);
        xp(1:ns-nns)=x(nns+1:ns);  
        xp(N-nns+1:N)=x(1:nns);
        Xf=dt*fft(xp);  
        n2=ceil(N/2);
        if n2==N/2;  
            X(1:n2-1)=Xf(n2+2:N);  
            X(n2:N)=Xf(1:n2+1);
            f=(-n2+1)*df:df:n2*df;  
            no=n2;
        else;  X(1:n2-1)=Xf(n2+1:N);  
            X(n2:N)=Xf(1:n2);
            f=(-n2+1)*df:df:(n2-1)*df;  
            no=n2;  
        end;
        
