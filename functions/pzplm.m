      function [z,p,k]=pzplm(form,a,b,po,amv,grs,tl,gr)
%
%     %  pzplm.m
%     %   function [z,p,k]=pzplm(form,a,b,po,amv,grs,tl,gr)
%     %           Generates a pole-zero plot with position and size
%     %           specified by vector po.
%     %             po(1) and po(2) = lower left corner  (x,y)
%     %             po(3) and po(4) = size  (x,y)
%     %             amv = axes maximum value
%     %             grs = grid line or tick spacing
%     %             tl - no tick or grid line labels if tl=0
%     %             gr - no grid lines if gr=0
%
%     %           form='tf' - a=num coeff, b=denom coeff of transform
%     %             finds transform zeros, z, poles,p, and
%     %             multiplicative factor, k
%     %           form='pz' - a= zeros, b= poles of transform
%     %             z=a, p=b, k=1
%     %
%     %     pzplm.m modified for repeated use to generate a root locus
%     %
      %  Gordon E. Carlson   University of Missouri-Rolla

        if form=='tf';  [z,p,k]=tf2zp(a,b);
         elseif form=='pz';  z=a;  p=b;  k=1;  end;
        nz=size(z,1);  np=size(p,1);
        ax=-amv:grs:amv;
        for m=1:nz;
          plct(real(z(m)),imag(z(m)),ax,ax,po,1,1,'o',0);  hold on;
          if tl==0; set(gca,'xticklabels',[' '],'yticklabels',[' ']); end;
          if gr==0;  grid off;  end;  axis square;  end;
        for m=1:np;
          plct(real(p(m)),imag(p(m)),ax,ax,po,1,1,'x',0);  hold on;
          if tl==0; set(gca,'xticklabels',[' '],'yticklabels',[' ']); end;
          if gr==0;  grid off;  end;  axis square;  end;
        plct(ax,zeros(size(ax)),ax,ax,po,1,1,'-',0);
        if tl==0; set(gca,'xticklabels',[' '],'yticklabels',[' ']); end;
        if gr==0;  grid off;  end;  axis square;
        plct(zeros(size(ax)),ax,ax,ax,po,1,1,'-',0);
        if tl==0; set(gca,'xticklabels',[' '],'yticklabels',[' ']); end;
        if gr==0;  grid off;  end;  axis square;
