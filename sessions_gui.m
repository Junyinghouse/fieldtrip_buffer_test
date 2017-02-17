function varargout = sessions_gui(varargin)
% SESSIONS_GUI MATLAB code for sessions_gui.fig
%      SESSIONS_GUI, by itself, creates a new SESSIONS_GUI or raises the existing
%      singleton*.
%
%      H = SESSIONS_GUI returns the handle to a new SESSIONS_GUI or the handle to
%      the existing singleton*.
%
%      SESSIONS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SESSIONS_GUI.M with the given input arguments.
%
%      SESSIONS_GUI('Property','Value',...) creates a new SESSIONS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sessions_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sessions_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sessions_gui

% Last Modified by GUIDE v2.5 17-Feb-2017 10:17:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sessions_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @sessions_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
 
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% End initialization code - DO NOT EDIT


% --- Executes just before sessions_gui is made visible.
function sessions_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sessions_gui (see VARARGIN)

% Choose default command line output for sessions_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sessions_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sessions_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Fr_Callback(hObject, eventdata, handles)
% hObject    handle to Fr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fr as text
%        str2double(get(hObject,'String')) returns contents of Fr as a double


% --- Executes during object creation, after setting all properties.
function Fr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wdet_Callback(hObject, eventdata, handles)
% hObject    handle to wdet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wdet as text
%        str2double(get(hObject,'String')) returns contents of wdet as a double


% --- Executes during object creation, after setting all properties.
function wdet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wdet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ov_Callback(hObject, eventdata, handles)
% hObject    handle to ov (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ov as text
%        str2double(get(hObject,'String')) returns contents of ov as a double


% --- Executes during object creation, after setting all properties.
function ov_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ov (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_go.
function button_go_Callback(hObject, eventdata, handles)
% hObject    handle to button_go (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hdr = ft_read_header('buffer://localhost:1972'); 
% par.Fs = hdr.Fs;
get(handles.button_go,'Value')
par.Fr = str2double(get(handles.Fr,'String'));
par.ov = str2double(get(handles.ov,'String'));
par.wdet = str2double(get(handles.wdet,'String'));
pause_t = par.wdet*(1-(1/par.ov));
pause_t = 1.5;
Nwin = par.Fs*par.wdet;
int = 1;
axes(handles.axes4)
c = 0;
while true
   c = c+1;
  fin = int +Nwin -1;
  epoch_eeg = ft_read_data('buffer://localhost:1972','begsample',int,'endsample',fin);  % epoch_eeg readed from buffer in detect windows is cahnnels by sample points: Ns by Nwin
  eeg = resample(double(epoch_eeg'),par.Fr,par.Fs); % eeg is resampled whose dimension is sample points by channels : Nt * Ns
  plot(eeg)
   plot(epoch_eeg')
  x = sin(1:0.1:100);
  plot(x)
  pause(pause_t); % wait new data write to buffer, in order to insure the endsample  fin <= inf
  int = int+Nwin*(1-(1/par.ov)) -1;
  assignin('base','int',int)
  assignin('base','fin',fin)
  assignin('base','i',c)
  cla;
   if isappdata(handles.button_stop,'stopPlot')
        break;
   end
end
% ft_realtime_oddball

assignin('base','par',par)
assignin('base','x',epoch_eeg)



% --- Executes on button press in button_stop.
function button_stop_Callback(hObject, eventdata, handles)
% hObject    handle to button_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(handles.button_stop,'stopPlot',1);
   % Update handles structure
guidata(hObject, handles);

