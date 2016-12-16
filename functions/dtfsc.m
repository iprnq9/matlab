      function [Xm,mo,ro] = dtfsc(n,x,T,plt,nf,ev,a,bm,ba,YL1,YL2,YL3)
%
%     %  dtfsc.m
%     %   function [Xm,mo,ro] = dtfsc(n,x,T,plt,nf,ev,a,bm,ba,YL1,YL2,YL3)
%     %            Computes the discrete-time Fourier series coefficients
%     %             coefficients of the sequence x[n] for an expansion
%     %             interval specified by n.  Signal sample spacing=T.
%     %            Plots the coefficients, if desired, (this plot is
%     %             the spectrum of a periodic signal if the
%     %             expansion interval, n, equals one period)
%     %            ns signal samples used that produce ns coefficients.
%     %            Set up for -10*ns<n(1)<10*ns  (to change, see
%     %             statements 25 and 28).
%     %            Plot if plt=1.  vs. r if nf=1; else vs. f.
%     %            If ev=1 (real & even signal) plot Xm;
%     %             else, plot |Xm| and angle(Xm)
%     %            Frequency scale limits and grid spacing = a.
%     %            Xm or |Xm| scale limits and grid spacing = bm.
%     %            angle(Xm) scale limits and grid spacing = ba.
%     %            Xm(mo)=Xo.
%     %            ro=normalized fundamental frequency.
%     %            YL1,YL2,YL3 are y axis labels for Xm, |Xm|, angle(Xm).
      %  Gordon E. Carlson   University of Missouri-Rolla

        ns=size(n,2);  ro=1/ns;
        if n(1)<=0;  nns=-n(1);
          for i=1:10;  if nns>=ns;  nns=nns-ns;  end;  end;
          xpp(1:ns-nns)=x(nns+1:ns);  xpp(ns-nns+1:ns)=x(1:nns);
        else;   nzs=n(1);
          for i=1:10;  if nzs>=ns;  nzs=nzs-ns;  end;  end;
          xpp(1:nzs)=x(ns-nzs+1:ns);  xpp(nzs+1:ns)=x(1:ns-nzs);
        end;
        Xf=(1/ns)*fft(xpp);  n2=ceil(ns/2);
        if n2==ns/2;  Xm(1:n2-1)=Xf(n2+2:ns);  Xm(n2:ns)=Xf(1:n2+1);
                     n=-n2+1:n2;  mo=n2;
        else;  Xm(1:n2-1)=Xf(n2+1:ns);  Xm(n2:ns)=Xf(1:n2);
               n=-n2+1:n2-1;  mo=n2;  end;
        if ev==1;  Xm=real(Xm);  end;
        if plt==1;
          if nf==1; fp=ro;  xl='r';  else;  fp=ro/T;  xl='f';  end;
          if ev==1;
            pldt(n,Xm,fp,a,bm,[0.16,0.18,0.67,0.4],1,1.5,'o','-');
            xlabel(xl);  ylabel(YL1);
          else;
            pldt(n,abs(Xm),fp,a,bm,[0.16,0.6,0.67,0.28],1,1.5,'o','-');
            xlabel(xl);  ylabel(YL2);
            for i=1:ns;  if abs(Xm(i))<0.01*max(abs(Xm))&n(i)~=0;
              ang(i)=0;  else;  ang(i)=angle(Xm(i));  end;  end;
            pldt(n,ang,fp,a,ba,[0.16,0.18,0.67,0.28],1,1.5,'o','-');
            xlabel(xl);  ylabel(YL3);
          end;
        end;
