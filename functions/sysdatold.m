      function [rn,rd,imas,rhps,c,bf,ft,dr] = sysdat(n,d)
%
%     %  sysdat.m
%     %   function [rn,rd,imas,rhps,c,bf,ft,dr] = sysdat(n,d)
%     %             Computes constant multiplier, break frequencies,
%     %             factor types (1=linear, 2=quadratic, positive
%     %             for numerator factor, negative for denominator
%     %             factor), and quadratic factor damping ratios for
%     %             a transfer function or frequency response with
%     %             numerator coefficients n and denominator
%     %             coefficients d.  Coefficient order is highest
%     %             power to zero power of s or jw.
%     %              rn=zeros,   rd=poles
%     %              imas=[z p] number of imaginary axis zeros and poles
%     %              rhps=[z p] number of RHP zeros and poles
%     %              c=constant factor     (a positive scalar)
%     %              bf=break frequencies  (a vector)
%     %               linear (+,0,-)  quadratic (+,+,+)  (LHP,IMA,RHP)
%     %              ft=factor types   (a vector)
%     %               linear +1or-1  quadratic +2or-2  + Num, - Denom
%     %              dr=damping ratio      (a vector)
%     %               linear or jw  dr=10  no damping ratio
%     %               quadratic  (+,0,-)   (LHP,IMA,RHP)
      %  Gordon E. Carlson   University of Missouri-Rolla

        rn=roots(n);  rd=roots(d);  imas=[0 0];  rhps=[0 0];
        imz=0;  rhpz=0;  imp=0;  rhpp=0;
        for k=1:size(rn);
         if real(rn(k))>=-eps;  imz=imz+1;  end;
         if real(rn(k))>eps;  rhpz=rhpz+1;  end;  end;
        imas(1)=imz-rhpz;  rhps(1)=rhpz;
        for k=1:size(rd);
         if real(rd(k))>=-eps;  imp=imp+1;  end;
         if real(rd(k))>eps;  rhpp=rhpp+1;  end;  end;
        imas(2)=imp-rhpp;  rhps(2)=rhpp;
        rna=rn;  rda=rd;
        rna(size(n,2))=-1;  rda(size(d,2))=-1;
        m=0;
        for k=1:size(n,2)-1;
         if rna(k)==0;
          bfn(k-m)=rna(k);  ftn(k-m)=1;  drn(k-m)=10;
         elseif abs(imag(rna(k)))<(10^(-5))*abs(real(rna(k)));
          bfn(k-m)=-real(rna(k));  ftn(k-m)=1;  drn(k-m)=10;
         elseif imag(rna(k))==-imag(rna(k+1));
          bfn(k-m)=sqrt(rna(k)*rna(k+1));  ftn(k-m)=2;
          drn(k-m)=(-real(rna(k)))/bfn(k-m);  m=m+1;  end;  end;
        m=0;
        for k=1:size(d,2)-1;
         if rda(k)==0;
          bfd(k-m)=rda(k);  ftd(k-m)=-1;  drd(k-m)=10;
         elseif abs(imag(rda(k)))<(10^(-5))*abs(real(rda(k)));
          bfd(k-m)=-real(rda(k));  ftd(k-m)=-1;  drd(k-m)=10;
         elseif imag(rda(k))==-imag(rda(k+1));
          bfd(k-m)=sqrt(rda(k)*rda(k+1));  ftd(k-m)=-2;
          drd(k-m)=(-real(rda(k)))/bfd(k-m);  m=m+1;  end;  end;
        bf=[bfn bfd];  ft=[ftn ftd];  dr=[drn drd];
        for k=1:size(n,2);  if n(k)~=0;  cn=n(k);  end;  end;
        for k=1:size(d,2);  if d(k)~=0;  cd=d(k);  end;  end;
        c=abs(cn/cd);
