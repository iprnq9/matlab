      function [f,X,N,no]=dtft(n,x,T,dfm,plt,ev,nf,a,bm,pm,ba,pa,YL1,YL2,YL3)
%
%     %  dtft.m
%     %   function [f,X,N,no]=dtft(n,x,T,dfm,plt,ev,nf,a,bm,pm,ba,pa,YL1,YL2,YL3)
%     %           Computes and plots the discrete-time Fourier
%     %            transform of signal x[nT] extending from n1 to n2
%     %            (n1<=0  n2>0).  T=sample spacing
%     %           dfm=upper limit on transform point spacing
%     %           ns=size(x,2)=number of signal samples.
%     %           Transform computed with N samples, where N=2*ns or
%     %           N=ceil(1/(dfm*T)), whichever is larger.
%     %           since N>ns, signal samples are zero padded.
%     %           Plot if plt=1.  If ev=1, (real & even signal) plot
%     %            X(f); else, plot |X(f)| and angle(X(f)).  If nf=1,
%     %            plot vs normalized frequency; else, vs frequency.
%     %           Frequency scale limits and grid spacing = a.
%     %           X(f) or |X(f)| scale limits and grid spacing = bm.
%     %           angle(X(f)) scale limits and grid spacing = ba.
%     %           pm is position and size vector for X(f) or |X(f)|.
%     %           pa is position and size vector for angle(X(f)).
%     %           X(no)=Xo
%     %           YL1,YL2,YL3 are y axis labels for X(f),|X(f)|,
%     %            and angle(X(f)).
      %  Gordon E. Carlson   University of Missouri-Rolla

        ns=size(x,2);
        N=ceil(1/(dfm*T));  if N<2*ns;  N=2*ns;  end;  df=1/(N*T);
        xp=zeros(1,N);  nns=sum(n<0);
          xp(1:ns-nns)=x(nns+1:ns);  xp(N-nns+1:N)=x(1:nns);
        Xf=fft(xp);  n2=ceil(N/2);
        if n2==N/2;  X(1:n2-1)=Xf(n2+2:N);  X(n2:N)=Xf(1:n2+1);
                     f=(-n2+1)*df:df:n2*df;  no=n2;
        else;  X(1:n2-1)=Xf(n2+1:N);  X(n2:N)=Xf(1:n2);
               f=(-n2+1)*df:df:(n2-1)*df;  no=n2;  end;
        if nf==1;  fp=f*T;  xl='r';  else;  fp=f;  xl='f';  end;
        if ev==1;  X=real(X);  end;
        if plt==1;
          if ev==1;
            plct(fp,X,a,bm,pm,1,1.5,'-',0);
            xlabel(xl);  ylabel(YL1);
          else;
            plct(fp,abs(X),a,bm,pm,1,1.5,'-',0);
            xlabel(xl);  ylabel(YL2);
            plct(fp,angle(X),a,ba,pa,1,1.5,'-',0);
            xlabel(xl);  ylabel(YL3);
          end;
        end;
