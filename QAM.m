% Create a random digital message
M = 16;                     % Alphabet size
x = randi([0 M-1],5000,1);  % Random symbols

% Use 16-QAM modulation.
hMod = comm.RectangularQAMModulator('ModulationOrder',M);
hDemod = comm.RectangularQAMDemodulator('ModulationOrder',M);

% Create a constellation diagram object.
cpts = constellation(hMod);
hConst = comm.ConstellationDiagram('ReferenceConstellation',cpts, ...
    'XLimits',[-4 4],'YLimits',[-4 4]);

% Apply 16-QAM modulation.
y = step(hMod,x);

% Transmit signal through an AWGN channel.
ynoisy = awgn(y,15,'measured');

% Create constellation diagram from noisy data.
step(hConst,ynoisy)

% Demodulate ynoisy to recover the message.
z = step(hDemod,ynoisy);

% Check symbol error rate.
[num,rt] = symerr(x,z)

%%
% ==============================================
% Documentation example from
% "Constellation for 16-PSK"
% in modulation.xml

% begindocexample 16psk_const
% Use 16-PSK modulation with no phase offset and binary symbol mapping.
hMod = comm.PSKModulator(16,0,'SymbolMapping','binary');

% Create a scatter plot
constellation(hMod)
% enddocexample 16psk_const

%%
% ==============================================
% Documentation example from
% "Constellation for 32-QAM"
% in modulation.xml

% Example: Plotting Signal Constellations
% Constellation for 32-QAM

% Copyright 2003 The MathWorks, Inc.

close all;

% begindocexample 32qam_const
% Create 32-QAM modulator with binary symbol mapping
hMod = comm.RectangularQAMModulator(32,'SymbolMapping','binary');
% Create a scatter plot
constellation(hMod)
% enddocexample 32qam_const

%doctouchupfigure(gcf,1);

%%
% ==============================================
% Documentation example from
% "Gray-Coded Signal Constellation"
% in modulation.xml

% begindocexample graycoded_const
% Create 8-QAM Gray encoded modulator
hMod = comm.RectangularQAMModulator(8);
% Create a scatter plot
constellation(hMod)
% enddocexample graycoded_const