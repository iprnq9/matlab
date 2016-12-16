      function pldt(n,y,T,xg,yg,p,aw,lw,st,lt);
%
%     % pldt.m
%     %  function pldt(n,y,T,xg,yg,p,aw,lw,st,lt);
%     %          Plots discrete-time signal with sample spacing T.
%     %          vectors of grid locations are xg and yg.  axes limits
%     %          are xg(1),xg(max) and yg(1),yg(max).  p(1),p(2) = plot
%     %          lower left corner.  p(3),p(4) = plot size.
%     %          aw = axes linewidth, lw = plot linewidth.
%     %          st = symbol type, lt = line type.
%
%     %          The symbol size, ss, is set to ss=2*lw in the first
%     %          statement to produce nice size dots on top of lines
%     %          with st='o'.  larger symbol size is required if more
%     %          than one signal is displayed on one plot
%
%     %          stemm.m is the MATLAB function contained in stem.m
%     %          with          function stem(x,y,linetype)
%     %           replaced by  function stemm(x,y,symtype,linetype)
%     %          and           h=plot(x,y,'o',xx(:),yy(:),linetype)
%     %           replaced by  h=plot(x,y,symtype,xx(:),yy(:),linetype)
%     %          This permits a choice of symbol on the top of the stems
      %  Gordon E. Carlson   University of Missouri-Rolla

         ss=2*lw;
         set(gcf,'defaulttextfontname','times');
         set(gcf,'defaultaxesfontname','times');
         set(gcf,'defaultaxesgridlinestyle',':');
         set(gcf,'defaultaxeslinewidth',aw,'defaultlinelinewidth',lw);
         set(gcf,'defaultlinemarkersize',ss);
         subplot('position',[p(1),p(2),p(3),p(4)]);  stemm(n*T,y,st,lt);
         sx = size(xg,2);   sy = size(yg,2);
         set(gca,'xlim',[xg(1),xg(sx)],'ylim',[yg(1),yg(sy)]);
         set(gca,'xtick',[xg],'ytick',[yg]);
         grid on;
