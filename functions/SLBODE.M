      function [am,ph]=slbode(w,c,bf,ft,dr)
%
%     %  slbode.m
%     %   function [am,ph]=slbode(w,c,bf,ft,dr)
%     %             Computes the straight line approximation to the
%     %             amplitude (am) and phase (ph) bode plots vs. freq. w
%     %              w=frequency scale (rad/sec)
%     %              c=constant factor        (a positive scalar)
%     %              bf=break frequencies     (a vector)
%     %               linear (+,0,-)  quadratic (+,+,+)  (LHP IMA RHP)
%     %              ft=factor types      (a vector)
%     %               linear +1or-1  quadratic +2or-2  + Num, - Denom
%     %              dr=damping ratio         (avector)
%     %               linear or jw  dr=10  no damping ratio
%     %               quadratic  (+,0,-)   (LHP,IMA,RHP)
      %  Gordon E. Carlson   University of Missouri-Rolla

        nf=size(w,2);
        bm=bf.*(bf~=0)+(bf==0);
        n=size(bf,2);
        mf=meshgrid(w,1:n);
        mc=(meshgrid(c,1:nf))';
        mbf=(meshgrid(bf,1:nf))';
        mbm=(meshgrid(bm,1:nf))';
        mft=(meshgrid(ft,1:nf))';
        mdr=(meshgrid(dr,1:nf))';
        if (n==1);
         am=20*log10(mc)+(20*mft.*(log10(mf)...
            -log10(abs(mbm))).*(us(mf-abs(mbm)).*(mbf~=0)+(mbf==0)));
        else;
         am=20*log10(mc)+sum(20*mft.*(log10(mf)...
            -log10(abs(mbm))).*(us(mf-abs(mbm)).*(mbf~=0)+(mbf==0)));
        end;
        f1=0.1*abs(mbm);
        f2=10*abs(mbm);
        phl=45*(log10(mf)-log10(f1)).*us(mf-f1)...
            -45*(log10(mf)-log10(f2)).*us(mf-f2);
        drm=abs(mdr)+0.001*(mdr==0);
        drm=drm-8.9*(mdr==10);
        ma=(1.41-0.15*drm).*drm.*(drm<=0.2)...
            +(1.475-0.475*drm).*drm.*(drm>0.2);
        f3=(10.^(-ma)).*abs(mbm);
        f4=(10.^(ma)).*abs(mbm);
        sl=180./(log10(f4)-log10(f3));
        phq=0.5*(sl.*(log10(mf)-log10(f3)).*us(mf-f3)...
            -sl.*(log10(mf)-log10(f4)).*us(mf-f4));
        if (n==1);
          ph=90*mft.*(mbf==0)+(phl.*mft.*(mbf>0)...
             +(180-phl).*mft.*(mbf<0)).*(abs(mft)==1)+(phq.*mft.*(mdr>0)...
             +mft.*(0*(mf<=mbf)+90*(mf>mbf)).*(mdr==0)...
             +(180-phq).*mft.*(mdr<0)).*(abs(mft)==2);
        else;
          ph=sum(90*mft.*(mbf==0)+(phl.*mft.*(mbf>0)...
             +(180-phl).*mft.*(mbf<0)).*(abs(mft)==1)+(phq.*mft.*(mdr>0)...
             +mft.*(0*(mf<=mbf)+90*(mf>mbf)).*(mdr==0)...
             +(180-phq).*mft.*(mdr<0)).*(abs(mft)==2));
        end;
