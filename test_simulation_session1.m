% matlab session1 is to real -time EEG acquisition
% The FieldTrip buffer represents three elements: the header structure, the data matrix and a list of event structures.
% Since we target real-time usage, both the data matrix and the list of events will usually be implemented as a ring buffer
% which means that after a time, old data samples and events will not be accessible anymore

cfg = [];
% cfg.channel = [1 2 3 4 5];
%% real-time EEG acquisition from EEG amplifier

% FT_REALTIME_BRAINAMPPROXY reads continuous data from a BrainAmp EEG acquisition
% system through the RDA network interface and writes it to a FieldTrip buffer.
% ft_realtime_brainampproxy(cfg)

% or Instead of ft_realtime_brainampproxy in MATLAB, you can use  'rda2ft.exe'  to transport data from an RDA server to a FieldTrip buffer. 

%% simulatiing real-time EEG acquisition  from disk
cfg.maxblocksize = 3 ;% in seconds
cfg.source.dataset  ='DJ18.eeg';
cfg.source.headerfile = 'DJ18.vhdr';
cfg.source.eventfile = 'DJ18.vmrk';
% FT_REALTIME_FILEPROXY reads continuous data from an EEG/MEG file and writes it to a FieldTrip buffer
ft_realtime_fileproxy(cfg) 

for i = 2800000 : 2900120
    i
    x = ft_read_data('buffer://localhost:1972','begsample',i,'endsample',2898001);
end
% if count==1
%     % the input file may have a different offset than the output file
%     offset = begsample - 1;
%     % flush the file, write the header and subsequently write the data segment
%     ft_write_data(cfg.target.datafile, dat, 'header', hdr, 'dataformat', cfg.target.dataformat, 'chanindx', chanindx, 'append', false);
%     if ~strcmp(cfg.readevent,'no')
%         for i=1:numel(evt)
%             evt(i).sample = evt(i).sample - offset;
%         end
%         ft_write_event(cfg.target.eventfile,evt,'append',false);
%     end
% else
%     % write the data segment
%     ft_write_data(cfg.target.datafile, dat, 'header', hdr, 'dataformat', cfg.target.dataformat, 'chanindx', chanindx, 'append', true);
%     if ~strcmp(cfg.readevent,'no')
%         for i=1:numel(evt)
%             evt(i).sample = evt(i).sample - offset;
%         end
%         ft_write_event(cfg.target.eventfile,evt,'append',true);
%     end
% end % if count==1
% 
% % wait for a realistic amount of time
% pause(((endsample-begsample+1)/hdr.Fs)/cfg.speed);








% cfg.resample = 100;% here resampling frequency
% ft_realtime_fileproxy_me(cfg)

% cfg.fsample= 100;      % in Hz 
% cfg.blocksize = 3; 
% cfg.bpfilter      = 'yes' ;
% cfg.bpfreq       = [2 10];
% ft_realtime_signalproxy(cfg)

