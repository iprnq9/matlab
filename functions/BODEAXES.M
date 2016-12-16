
%       bodeaxes.m - function bodeaxes(w1,N,A,P,nf)
%                    Plots amplitude and phase response plot axes.
%         w1 = Horizontal axis beginning frequency in radians
%              per second.  Must be a power of 10.
%          N = Number of horizontal axis cycles.
%              Choices are 3,4,5,6,7,or 8.
%          A = Maximum amplitude.  Must be a multiple of 20.
%          P = Maximum phase.  Must be a multiple of 90.
%         nf = Number of figures.  [ nf=1 --> Amplitude and Phase plots
%              on the same figure.  nf=2 --> Larger Amplitude and Phase
%              plots on separate figures. ]

      function bodeaxes(w1,N,A,P,nf)

        fa=w1:0.01*w1:10*w1-0.01*w1;
        f=[fa,10*fa,100*fa];
        if N==4;  f=[f,1e3*fa];  end;
        if N==5;  f=[f,1e3*fa,1e4*fa];  end;
        if N==6;  f=[f,1e3*fa,1e4*fa,1e5*fa];  end;
        if N==7;  f=[f,1e3*fa,1e4*fa,1e5*fa,1e6*fa];  end;
        if N==8;  f=[f,1e3*fa,1e4*fa,1e5*fa,1e6*fa,1e7*fa];  end;
        fga=zeros(size(1:7200));
        fga(901:900:6301)=2*A*ones(size(901:900:6301));
        fg=fga(1:size(f,2));
        ha=zeros(size(1:7200));  AA=A/30;
        if nf==2;  AA=A/50;  end;
        ha(1:100:801)=AA*ones(size(1:100:801));
        ha(901:100:1701)=AA*ones(size(1:100:801));
        ha(1801:100:2601)=AA*ones(size(1:100:801));
        ha(2701:100:3501)=AA*ones(size(1:100:801));
        ha(3601:100:4401)=AA*ones(size(1:100:801));
        ha(4501:100:5301)=AA*ones(size(1:100:801));
        ha(5401:100:6201)=AA*ones(size(1:100:801));
        ha(6301:100:7101)=AA*ones(size(1:100:801));
        h=ha(1:size(f,2));
        a=[w1,10*w1,100*w1,1e3*w1];  b=-A:20:A;
        if N==4;  a=[a,1e4*w1];  end;
        if N==5;  a=[a,1e4*w1,1e5*w1];  end;
        if N==6;  a=[a,1e4*w1,1e5*w1,1e6*w1];  end;
        if N==7;  a=[a,1e4*w1,1e5*w1,1e6*w1,1e7*w1];  end;
        if N==8;  a=[a,1e4*w1,1e5*w1,1e6*w1,1e7*w1,1e8*w1];  end;
        p=[0.15,0.56,0.66,0.43];
        if nf==2;  p=[0.15,0.15,0.75,0.75];  end;
        plctg(f,h,a,b,p,0.5,0.5,'-',1);  hold on;
        plctg(f,h-A,a,b,p,0.5,0.5,'-',1);
        plctg(f,A-h,a,b,p,0.5,0.5,'-',1);
        iA=round(A/20)-1; fhg=[f(1),f(size(f,2))];
        for k=-iA:iA;  hg=[k*20, k*20];
         plctg(fhg,hg,a,b,p,0.5,0.5,':',1);  end;
        plctg(f,fg-A,a,b,p,0.5,0.5,':',1);  hold off;
        xlabel('w       (rad/s)');  ylabel('|Hw(w)|       (dB)');

        if nf==2;  figure;  end;
        fga=zeros(size(1:7200));
        fga(901:900:6301)=2*P*ones(size(901:900:6301));
        fg=fga(1:size(f,2));
        ha=zeros(size(1:7200)); PP=P/25;
        if nf==2;  PP=P/50;  end;
        ha(1:100:801)=PP*ones(size(1:100:801));
        ha(901:100:1701)=PP*ones(size(1:100:801));
        ha(1801:100:2601)=PP*ones(size(1:100:801));
        ha(2701:100:3501)=PP*ones(size(1:100:801));
        ha(3601:100:4401)=PP*ones(size(1:100:801));
        ha(4501:100:5301)=PP*ones(size(1:100:801));
        ha(5401:100:6201)=PP*ones(size(1:100:801));
        ha(6301:100:7101)=PP*ones(size(1:100:801));
        h=ha(1:size(f,2));
        b=-P:90:P;
        p=[0.15,0.065,0.66,0.42];
        if nf==2;  p=[0.15,0.15,0.75,0.75];  end;
        plctg(f,h,a,b,p,0.5,0.5,'-',1);  hold on;
        plctg(f,h-P,a,b,p,0.5,0.5,'-',1);
        plctg(f,P-h,a,b,p,0.5,0.5,'-',1);
        iA=round(P/90)-1; fhg=[f(1),f(size(f,2))];
        for k=-iA:iA;  hg=[k*90, k*90];
         plctg(fhg,hg,a,b,p,0.5,0.5,':',1);  end;
        plctg(f,fg-P,a,b,p,0.5,0.5,':',1);  hold off;
        xlabel('w       (rad/s)');  ylabel('arg(Hw(w))       (deg)');

      function plctg(x,y,xg,yg,p,aw,lw,lt,axs);

      % plctg.m - plots continuous-time signal.  vectors of tick
      %           locations are xg and yg.  axes limits are xg(1),
      %           xg(max) and yg(1),yg(max).  p(1),p(2)=plot lower left
      %           corner.  p(3),p(4)=plot size.
      %           aw=axes line width, lw=plot line width, lt=line type
      %           axs=axes scale  0=linear  1=semilog  2=loglog

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
         grid off;
