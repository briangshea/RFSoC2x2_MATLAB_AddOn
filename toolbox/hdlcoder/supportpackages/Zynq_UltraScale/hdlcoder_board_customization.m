function r = hdlcoder_board_customization
% Board plugin registration file
% 1. Any registration file with this name on MATLAB path will be picked up
% 2. Registration file returns a cell array pointing to the location of 
%    the board plug-ins
% 3. Board plugin must be a package folder accessible from MATLAB path,
%    and contains a board definition file

% Copyright Brian G. Shea (bshea@eng.ucsd.edu)

r = { ...
    'RFSoC_2x2.plugin_board'
    };

end
% LocalWords:  Zynq ZC ZCU
