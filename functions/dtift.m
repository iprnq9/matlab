      function [n,x,T]=dtift(f,X,plt,cc,seq,a,bm,pm,ba,pa,YL1,YL2,YL3)
%
%     %  dtift.m
%     %   function [n,x,T]=dtift(f,X,plt,cc,seq,a,bm,pm,ba,pa,YL1,YL2,YL3)
%     %            Computes and plots the inverse discrete-time
%     %             Fourier transform of transform X(f).
%     %            ns=size(X)=number of transform samples
%     %            and resulting signal samples.
%     %            Plot if plt=1.  If cc=1, ( X(-f)=X'(f) ) plot x(t);
%     %             else, plot |x(t)| and angle(x(t)), If seq=1' plot
%     %             sequence; else, plot signal.
%     %            Time scale limits and grid spacing = a.
%     %            x(t) or |x(t)| scale limits and grid spacing = bm.
%     %            angle(x(t)) scale limits and grid spacing = ba.
%     %            pm is position and size vector for x(t) or |x(t)|.
%     %            pa is position and size vector for angle(x(t)).
%     %            YL1,YL2,YL3 are y axis labels for x(t),|x(t)|,
%     %             and angle (x(t)).
      %  Gordon E. Carlson   University of Missouri-Rolla

        ns=size(X,2);  df=f(2)-f(1);  T=1/(ns*df);
        nns=find(f==0)-1;
          Xpp(1:ns-nns)=X(nns+1:ns);  Xpp(ns-nns+1:ns)=X(1:nns);
        xf=ifft(Xpp);  n2=ceil(ns/2);
        if n2==ns/2;  x(1:n2-1)=xf(n2+2:ns);  x(n2:ns)=xf(1:n2+1);
                     n=-n2+1:n2;
        else;  x(1:n2-1)=xf(n2+1:ns);  x(n2:ns)=xf(1:n2);
               n=-n2+1:n2-1;  end;
        if seq==1;  Tp=1;  xl='n';  else;  Tp=T;  xl='t';  end;
        if cc==1;  x=real(x);  end;
        if plt==1;
          if cc==1;
            pldt(n,x,Tp,a,bm,pm,1,1.5,'o','-');
            xlabel(xl);  ylabel(YL1);
          else;
            pldt(n,abs(x),Tp,a,bm,pm,1,1.5,'o','-');
            xlabel(xl);  ylabel(YL2);
            pldt(n,angle(x),Tp,a,ba,pa,1,1.5,'o','-');
            xlabel(xl);  ylabel(YL3);
          end;
        end;
