function varargout = interface_technique(varargin)
% INTERFACE_TECHNIQUE MATLAB code for interface_technique.fig
%      INTERFACE_TECHNIQUE, by itself, creates a new INTERFACE_TECHNIQUE or raises the existing
%      singleton*.
%
%      H = INTERFACE_TECHNIQUE returns the handle to a new INTERFACE_TECHNIQUE or the handle to
%      the existing singleton*.
%
%      INTERFACE_TECHNIQUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_TECHNIQUE.M with the given input arguments.
%
%      INTERFACE_TECHNIQUE('Property','Value',...) creates a new INTERFACE_TECHNIQUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_technique_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_technique_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_technique

% Last Modified by GUIDE v2.5 06-Jan-2014 21:11:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_technique_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_technique_OutputFcn, ...
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
global Freq_base text_name_info text_name_program text_name_radio
global TA TP PTY Freq_other PI MS heure minutes jour M Y
main_RDS

% --- Executes just before interface_technique is made visible.
function interface_technique_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_technique (see VARARGIN)

% Choose default command line output for interface_technique
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface_technique wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_technique_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes during object creation, after setting all properties.
function autres_frequence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to autres_frequence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Freq_other
message='';
for k=1:size(Freq_other,2)
   message= sprintf('=>%d =>%d',Freq_other(k),messag);
end
set(hObject,'String',char(message));



function freq_autre_1_Callback(hObject, eventdata, handles)
% hObject    handle to freq_autre_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_autre_1 as text
%        str2double(get(hObject,'String')) returns contents of freq_autre_1 as a double


% --- Executes during object creation, after setting all properties.
function freq_autre_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_autre_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Freq_other
set(hObject,'String',Freq_other(1));



% --- Executes during object creation, after setting all properties.
function freq_autre_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_autre_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Freq_other
set(hObject,'String',Freq_other(2));

% --- Executes during object creation, after setting all properties.
function freq_autre_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_autre_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Freq_other
set(hObject,'String',Freq_other(3));




% --- Executes during object creation, after setting all properties.
function freq_autre_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_autre_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Freq_other
set(hObject,'String',Freq_other(4));
% --- Executes during object creation, after setting all properties.
function freq_autre_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_autre_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Freq_other
set(hObject,'String',Freq_other(5));

function freq_autre_6_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global Freq_other
set(hObject,'String',Freq_other(6));



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global PI 
set(hObject,'String',sprintf('PI=%s',PI));


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global PTY
set(hObject,'String',sprintf('PTY = %s',ptytochar(PTY)));



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global MS
set(hObject,'String',sprintf('MS = %d',MS));




function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
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
