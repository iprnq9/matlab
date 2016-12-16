      function [t,x,N]=ctift(f,X,dtm)
%
%     %  ctift.m
%     %   function [t,x,N]=ctift(f,X,dtm)
%     %            Computes the inverse Fourier transform of
%     %             transform X(f).
%     %            dtm=upper limit on signal point spacing
%     %            ns=size(X)=number of transform points
%     %            df=transform point spacing
%     %            Signal computed with N points, where N=ns or
%     %            N=ceil(1/(dtm*df)), whichever is larger.
%     %            If N>ns, transform points are zero padded.

      %  Written by Gordon E. Carlson   University of Missouri-Rolla
      %  Modified by Randy H. Moss      University of Missouri-Rolla

        ns=size(X,2);  
        df=f(2)-f(1);
        N=ceil(1/(dtm*df));  
        if N<ns;  
            N=ns;  
        end;  
        dt=1/(N*df);
        Xp=zeros(1,N);  
        Xp(1:ns)=X;
        nns=sum(f<0);
        Xpp(1:ns-nns)=Xp(nns+1:ns);  
        Xpp(N-nns+1:N)=Xp(1:nns);
        xf=N*df*ifft(Xpp);  
        n2=ceil(N/2);
        if n2==N/2;  
            x(1:n2-1)=xf(n2+2:N);  
            x(n2:N)=xf(1:n2+1);
            t=(-n2+1)*dt:dt:n2*dt;
        else;  
            x(1:n2-1)=xf(n2+1:N);  
            x(n2:N)=xf(1:n2);
            t=(-n2+1)*dt:dt:(n2-1)*dt;  
        end;
