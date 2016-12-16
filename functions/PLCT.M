      function plct(x,y,xg,yg,p,aw,lw,lt,axs);
%
%     % plct.m
%     %  function plct(x,y,xg,yg,p,aw,lw,lt,axs);
%     %          Plots continuous-time signal.  vectors of grid
%     %          locations are xg and yg.  axes limits are xg(1),
%     %          xg(max) and yg(1),yg(max).  p(1),p(2)=plot lower left
%     %          corner.  p(3),p(4)=plot size.
%     %          aw=axes line width, lw=plot line width, lt=line type
%     %          axs=axes scale  0=linear  1=semilog  2=loglog
      %  Gordon E. Carlson   University of Missouri-Rolla

         set(gcf,'defaulttextfontname','times');
         set(gcf,'defaultaxesfontname','times');
         set(gcf,'defaultaxesgridlinestyle',':');
         set(gcf,'defaultaxeslinewidth',aw,'defaultlinelinewidth',lw);
         subplot('position',[p(1),p(2),p(3),p(4)]);  plot(x,y,lt);
         sx = size(xg,2);   sy = size(yg,2);
         if (axs>=1);  set(gca,'xscale','log');  end;
         if (axs>=2);  set(gca,'yscale','log');  end;
         set(gca,'xlim',[xg(1),xg(sx)],'ylim',[yg(1),yg(sy)]);
         set(gca,'xtick',[xg],'ytick',[yg]);
         grid on;
