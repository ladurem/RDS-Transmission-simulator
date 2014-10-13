function varargout = interface_util(varargin)
% INTERFACE_UTIL MATLAB code for interface_util.fig
%      INTERFACE_UTIL, by itself, creates a new INTERFACE_UTIL or raises the existing
%      singleton*.
%
%      H = INTERFACE_UTIL returns the handle to a new INTERFACE_UTIL or the handle to
%      the existing singleton*.
%
%      INTERFACE_UTIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_UTIL.M with the given input arguments.
%
%      INTERFACE_UTIL('Property','Value',...) creates a new INTERFACE_UTIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_util_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_util_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_util

% Last Modified by GUIDE v2.5 06-Jan-2014 20:25:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_util_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_util_OutputFcn, ...
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
global Freq_base
global text_name_info
global text_name_program
global text_name_radio
global TA TP PTY
global heure minutes jour M Y;
main_RDS

% --- Executes just before interface_util is made visible.
function interface_util_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_util (see VARARGIN)

% Choose default command line output for interface_util
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface_util wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_util_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function frequence_Callback(hObject, eventdata, handles)
% hObject    handle to frequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frequence as text
%        str2double(get(hObject,'String')) returns contents of frequence as a double


% --- Executes during object creation, after setting all properties.
function frequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Freq_base;
    set(hObject,'String',Freq_base);



function nom_radio_Callback(hObject, eventdata, handles)
% hObject    handle to nom_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nom_radio as text
%        str2double(get(hObject,'String')) returns contents of nom_radio as a double


% --- Executes during object creation, after setting all properties.
function nom_radio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nom_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global text_name_radio;
    set(hObject,'String',char(text_name_radio));


% --- Executes during object creation, after setting all properties.
function infos_prog_CreateFcn(hObject, eventdata, handles)
% hObject    handle to infos_prog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global text_name_program;
    set(hObject,'String',text_name_program);



function info_prog_Callback(hObject, eventdata, handles)
% hObject    handle to info_prog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of info_prog as text
%        str2double(get(hObject,'String')) returns contents of info_prog as a double


% --- Executes during object creation, after setting all properties.
function info_prog_CreateFcn(hObject, eventdata, handles)
% hObject    handle to info_prog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global text_name_program;
    set(hObject,'String',char(text_name_program));



function info_radio_Callback(hObject, eventdata, handles)
% hObject    handle to info_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of info_radio as text
%        str2double(get(hObject,'String')) returns contents of info_radio as a double


% --- Executes during object creation, after setting all properties.
function info_radio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to info_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global text_name_info;
    set(hObject,'String',char(text_name_info));



function info_rds_Callback(hObject, eventdata, handles)
% hObject    handle to info_rds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of info_rds as text
%        str2double(get(hObject,'String')) returns contents of info_rds as a double


% --- Executes during object creation, after setting all properties.
function info_rds_CreateFcn(hObject, eventdata, handles)
% hObject    handle to info_rds (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global TA TP PTY
msg_TA='Désactivé';msg_TP='Désactivé';
if TA
    msg_TA = 'Activé';
end
if TP
    msg_TP = 'Activé';
end
message = sprintf('TA: %s - TP: %s',msg_TA,msg_TP);
set(hObject,'String',message);



function date_heure_Callback(hObject, eventdata, handles)
% hObject    handle to date_heure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of date_heure as text
%        str2double(get(hObject,'String')) returns contents of date_heure as a double


% --- Executes during object creation, after setting all properties.
function date_heure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date_heure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global heure minutes jour M Y;
if minutes<10
  set(hObject,'String',sprintf('Il est %dh0%d, le %d/%d/%d',heure,minutes,jour,M,Y));
else
    
set(hObject,'String',sprintf('Il est %dh%d, le %d/%d/%d',heure,minutes,jour,M,Y));

end


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
