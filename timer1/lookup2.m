scalefactor=4095;
ts=1000;
anglestep=2*pi/ts;
angles=0:anglestep:2*pi-anglestep;
waveform=sin(angles);
lookup=scalefactor+scalefactor*waveform;
fid=fopen('lookup.h','w');
fprintf(fid,'const uint8_t SineArray[]={');
for i=1:length(lookup)
  fprintf(fid,'%d',floor(lookup(i)+1));
  fprintf(fid,',\n');
end
fprintf(fid,'};');
fclose(fid);