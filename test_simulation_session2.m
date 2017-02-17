
clear all
figure
hdr = ft_read_header('buffer://localhost:1972'); 
disp(hdr.nSamples);
% while true
%  
%   win_x = [];
%   x = ft_read_data('buffer://localhost:1972','begsample',1,'endsample',inf);   
%   pause(2);clf;
%   y= ft_read_data('buffer://localhost:1972','begsample',9999,'endsample',inf);
%   win_x = y(:,(size(x,2)+1):end);
%   plot(win_x');
%   if isempty(win_x)
%       break;
%   end
% end
Fs =1000;
wdet = 3; %secs
count = 0;
Nt = Fs*wdet;
ini = 1;
ov =3;
pause_t = wdet*(1-(1/ov));
while true
  count = count +1;
  fin = ini +Nt-1;
  x1 = ft_read_data('buffer://localhost:1972','begsample',1,'endsample',inf);  
  x = ft_read_data('buffer://localhost:1972','begsample',ini,'endsample',fin);  
  plot(x'); 
  ini= ini + round(Nt*(1-(1/ov))) - 1;
  pause(pause_t)
  cla
   
%   if isempty(win_x)
%       break;
%   end
end