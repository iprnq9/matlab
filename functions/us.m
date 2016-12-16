      function u = us(t)
%
%     % us.m
%     %  function u = us(t)
%     %        Generates the unit step function u(t)

      %  Gordon E. Carlson   University of Missouri-Rolla

         u = 0.*(t<0) + 1.*(t>=0);
