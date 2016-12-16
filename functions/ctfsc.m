      function [Xn,f,ang,No,Fo] = ctfsc(t,x)

    %  ctfsc.m
    %  [Xn,f,ang,No,Fo] = ctfsc(t,x)
    %    Computes the Fourier series coefficients of the signal
    %       x(t) for an expansion interval specified by t.
    %      ns signal samples used that produce ns coefficients.
    %      Set up for -10*ns*dt<t(1)<10*ns*dt  
    %            
    %   Gordon E. Carlson   University of Missouri-Rolla
    %
    %   The plotting segement of this function has been changed.
    %   If the signal is real and even only the coefficients are plotted.
    %
    %   t : time array
    %   x : signal array
    %   f: frequency array for plotting
    %   ang : Angle array for plotting
    %   Xn: coefficient array
    %   no: center coefficient Xn(no)
    %   fo: fundamental frequency
    %   modified May 2002 Laura Tomaja University of Missouri-Rolla
    
        ns=size(t,2);  dt=t(2)-t(1);  fo=1/(ns*dt);
        if t(1)<=0;  nns=round(t(1)/(-dt));
          for i=1:10;  
              if nns>=ns;  
                  nns=nns-ns;  
              end;  
          end;
           xpp(1:ns-nns)=x(nns+1:ns);  xpp(ns-nns+1:ns)=x(1:nns);
        else;   
            nzs=round(t(1)/dt);
       for i=1:10;  
           if nzs>=ns;  
               nzs=nzs-ns;  
           end;  
       end;
          xpp(1:nzs)=x(ns-nzs+1:ns);  xpp(nzs+1:ns)=x(1:ns-nzs);
       end;
        Xf=(1/ns)*fft(xpp);  n2=ceil(ns/2);
       if n2==ns/2;  
           Xn(1:n2)=Xf(n2+1:ns);  
           Xn(n2+1:ns+1)=Xf(1:n2+1);
           n=-n2:n2;  na=ns+1;  no=n2+1;
        else;  
           Xn(1:n2-1)=Xf(n2+1:ns);  
           Xn(n2:ns)=Xf(1:n2);
           n=-n2+1:n2-1;  na=ns;  no=n2; 
       end;
        for i=1:na;  
            if abs(Xn(i))<0.01*max(abs(Xn))&n(i)~=0;
              ang(i)=0;  
          else;  
              ang(i)=angle(Xn(i));  
         end;  
     end;
     No=no;
     Fo=fo;
     f = fo.*[-no+1:no-1];