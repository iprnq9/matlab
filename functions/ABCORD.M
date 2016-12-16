      function [n,wss]=abcord(type,pband,wc,ws,gs,dBwrmg,maxg,rdB)
%
%     %  abcord.m
%     %   function [n,wss]=abcord(type,pband,wc,ws,gs,dBwrmg,maxg,rdB)
%     %             Picks order of Butterworth or Chebyshev normalized
%     %             LPF prototype required to satisfy analog LPF, HPF,
%     %             BPF, or BRF stopband specs at freqs ws when cutoff
%     %             freqs are wc.
%     %             size(ws)=size(wc)= (1 for LPF, HPF; 2 for BPF, BRF)
%     %             Up to Mth order (M set equal to 10 in statements
%     %             34 and 41).  Sets n=20 if order cannot be picked,
%     %             that is, if required greater than 10
%     %              n = required order.
%     %              wss - scaled stopband freqs.
%     %              HdB = gain wrt max gain in dB at normalized stopband
%     %                    frequency wsn. (for filter orders 1 through M).
%     %                     not an output but available if desired
%     %              type - 'b'=Butterworth, 'c'=Chebyshev.
%     %              pband - 'lp'=LPF,  'hp'=HPF,  'bp'=BPF,  'br'=BRF.
%     %              gs = desired max gain at all values of ws.
%     %              dBwrmg - 'y' means gs is dB wrt max gain
%     %                       else gs is numerical gain.
%     %              maxg = maximum gain (value used if dbwrmg is not 'y').
%     %              rdB = passband ripple in dB for a Chebyshev filter
%     %                    value used if type='c'.
      %  Gordon E. Carlson   University of Missouri-Rolla

        if size(wc,2)==1;  if pband=='lp';  wss=ws/wc;
          elseif pband=='hp';  wss=wc/ws;  end;  end;
        if size(wc,2)==2;  wg2=wc(1)*wc(2);  wg2m=[wg2 wg2];
          wb=wc(2)-wc(1);  wbm=[wb wb];
          if pband=='bp';  wss=(ws.^2-wg2m)./(ws.*wbm);
          elseif pband=='br';  wss=(ws.*wbm)./(ws.^2-wg2m);  end;  end;
        wsn=min(abs(wss));
        e2=10^(0.1*rdB)-1;
        k=1:10;
        if type=='b';  aH2(k)=1./(1+wsn.^(2*k));
          elseif type=='c';  aH2(k)=1./(1+e2*(cosh(k*acosh(wsn))).^2);
        end;
        HdB=10*log10(aH2);
        if dBwrmg=='y';  ga=10^(0.05*gs);
          else;  ga=gs/maxg;  end;
        for k=1:10;
          if aH2(k)>ga^2;  in(k)=20;  else;  in(k)=k;  end;  end;
        n=min(in);
