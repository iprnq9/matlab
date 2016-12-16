      function [xfs,Xmm] = dtfs(n,x,T,Xm,mo,ro,N,plt,os,a,b,p,YL)
%
%     %  dtfs.m
%     %   function [xfs,Xmm] = dtfs(n,x,T,Xm,mo,ro,N,plt,os,a,b,p,YL)
%     %           Computes the discrete-time Fourier series
%     %            approximation xfs(nT) of the signal x[nT] over the
%     %            time interval nT from 2N+1 (or all if 2N+1>=size(Xm))
%     %            of the Fourier series coefficients Xm given
%     %            (centered on X(mo)=Xo).
%     %           Plot xfs[nT] if plt=1.  Also plot x[nT] on the same axes
%     %            as a dashed line if os=1.
%     %           Time scale limits and grid spacing = a.
%     %           xfs[nT] scale limits and grid spacing = b.
%     %           Plot location and size set by vector p.
%     %           YL is y axis label for x[nT].
      %  Gordon E. Carlson   University of Missouri-Rolla

        ns=size(n,2);  j=sqrt(-1);  Na=size(Xm,2);
        if 2*N+1<Na;
          for k=1:2*N+1;  Xmm(k)=Xm(k+mo-N-1);  end;
          m=(meshgrid(-N:N,1:ns))';
          nm=meshgrid(n,1:2*N+1);
        else;  Xmm=Xm;  m=(meshgrid(1-mo:Na-mo,1:ns))';
          nm=meshgrid(n,1:Na);  end;
        Xb=(meshgrid(Xmm,1:ns)).';
        xfs=real(sum(Xb.*exp(j*2*pi*m*ro.*nm)));
        if plt==1;  pldt(n,xfs,T,a,b,p,1,1.5,'o','-');
          if os==1;  hold on;
            pldt(n,x,T,a,b,p,1,1.5,'x','--');  hold off;  end;
          xlabel('t');   ylabel(YL);  end;
