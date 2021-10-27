function varargout = Final_Project(varargin)
% FINAL_PROJECT MATLAB code for Final_Project.fig
%      FINAL_PROJECT, by itself, creates a new FINAL_PROJECT or raises the existing
%      singleton*.
%
%      H = FINAL_PROJECT returns the handle to a new FINAL_PROJECT or the handle to
%      the existing singleton*.
%
%      FINAL_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_PROJECT.M with the given input arguments.
%
%      FINAL_PROJECT('Property','Value',...) creates a new FINAL_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Final_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Final_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Final_Project

% Last Modified by GUIDE v2.5 20-Dec-2019 16:34:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Final_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Final_Project_OutputFcn, ...
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


% --- Executes just before Final_Project is made visible.
function Final_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Final_Project (see VARARGIN)

% Choose default command line output for Final_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Final_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Final_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'Food_prices_afghanistan.csv'}, 'Select File');
if isequal(filename,0)
    return
else
    
    Path = strcat(pathname, filename);
    data = readtable(Path);
    set(handles.edit1, 'String', Path);
    
    Cols = [1 2 3 4 5 8];

    data = data(:,Cols);
    date = data.date;

    date = datenum(date(1:end,1));
    date= date(end:-1:1);
    data.date = date;
    assignin('base','data',data);
end
    
% --- Executes on button press in fuelRadioBtn.
function fuelRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to fuelRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.exchangeRadioBtn,'value',0) 
    set(handles.qualifiedRadioBtn,'value',0)
    set(handles.nonQualifiedRadioBtn,'value',0)
    
    
    set(handles.riceRadioBtn,'value',0)
    set(handles.breadRadioBtn,'value',0)
    set(handles.wheatRadioBtn,'value',0)
    set(handles.liveStockRadioBtn,'value',0)
end
item ='Fuel (diesel) - Retail';
assignin('base', 'item', item)


% Hint: get(hObject,'Value') returns toggle state of fuelRadioBtn


% --- Executes on button press in exchangeRadioBtn.
function exchangeRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to exchangeRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.fuelRadioBtn,'value',0)
    set(handles.qualifiedRadioBtn,'value',0)
    set(handles.nonQualifiedRadioBtn,'value',0)
    
    
    set(handles.riceRadioBtn,'value',0)
    set(handles.breadRadioBtn,'value',0)
    set(handles.wheatRadioBtn,'value',0)
    set(handles.liveStockRadioBtn,'value',0)
end
item ='Exchange rate - Retail';
assignin('base', 'item', item)

% Hint: get(hObject,'Value') returns toggle state of exchangeRadioBtn


% --- Executes on button press in year15RadioBtn.
function year15RadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to year15RadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.year16RadioBtn,'value',0)
    set(handles.year17RadioBtn,'value',0)
    set(handles.year18RadioBtn,'value',0)
    set(handles.year19RadioBtn,'value',0)
end
year2015 = get(handles.year15RadioBtn, 'value');
    Data = evalin('base','data');
    if(year2015 ==1)
    rangeMin2015 = datenum('1/1/2015');
    rangeMax2015 = datenum('12/31/2015');

    index = find(Data.date >= rangeMin2015 & Data.date <= rangeMax2015);
    year = Data(index,:);
    assignin('base','year',year);
    end
% Hint: get(hObject,'Value') returns toggle state of year15RadioBtn


% --- Executes on button press in year16RadioBtn.
function year16RadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to year16RadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.year15RadioBtn,'value',0)
    set(handles.year17RadioBtn,'value',0)
    set(handles.year18RadioBtn,'value',0)
    set(handles.year19RadioBtn,'value',0)
end
year2016 = get(handles.year16RadioBtn, 'value');
    Data = evalin('base','data');
    if(year2016 ==1)
    rangeMin2016 = datenum('1/1/2016');
    rangeMax2016 = datenum('12/31/2016');

    index = find(Data.date >= rangeMin2016 & Data.date <= rangeMax2016);
    year = Data(index,:);
    assignin('base','year',year);
    end
% Hint: get(hObject,'Value') returns toggle state of year16RadioBtn


% --- Executes on button press in year17RadioBtn.
function year17RadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to year17RadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.year15RadioBtn,'value',0)
    set(handles.year16RadioBtn,'value',0)
    set(handles.year18RadioBtn,'value',0)
    set(handles.year19RadioBtn,'value',0)
end
year2017 = get(handles.year17RadioBtn, 'value');
    Data = evalin('base','data');
    if(year2017 == 1)
    rangeMin2017 = datenum('1/1/2017');
    rangeMax2017 = datenum('12/31/2017');

    index = find(Data.date >= rangeMin2017 & Data.date <= rangeMax2017);
    year = Data(index,:);
    assignin('base','year',year);
    end
% Hint: get(hObject,'Value') returns toggle state of year17RadioBtn


% --- Executes on button press in year18RadioBtn.
function year18RadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to year18RadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.year15RadioBtn,'value',0)
    set(handles.year16RadioBtn,'value',0)
    set(handles.year17RadioBtn,'value',0)
    set(handles.year19RadioBtn,'value',0)
end
year2018 = get(handles.year18RadioBtn, 'value');
    Data = evalin('base','data');
    if(year2018 ==1)
    rangeMin2018 = datenum('1/1/2018');
    rangeMax2018 = datenum('12/31/2018');

    index = find(Data.date >= rangeMin2018 & Data.date <= rangeMax2018);
    year = Data(index,:);
    assignin('base','year',year);
    end
% Hint: get(hObject,'Value') returns toggle state of year18RadioBtn


% --- Executes on button press in year19RadioBtn.
function year19RadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to year19RadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.year15RadioBtn,'value',0)
    set(handles.year16RadioBtn,'value',0)
    set(handles.year17RadioBtn,'value',0)
    set(handles.year18RadioBtn,'value',0)
end
year2019 = get(handles.year19RadioBtn, 'value');
    Data = evalin('base','data');
    if(year2019 ==1)
    rangeMin2019 = datenum('1/1/2019');
    rangeMax2019 = datenum('12/31/2019');

    index = find(Data.date >= rangeMin2019 & Data.date <= rangeMax2019);
    year = Data(index,:);
    assignin('base','year',year);
    end
% Hint: get(hObject,'Value') returns toggle state of year19RadioBtn



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in riceRadioBtn.
function riceRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to riceRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.breadRadioBtn,'value',0)
    set(handles.wheatRadioBtn,'value',0)
    set(handles.liveStockRadioBtn,'value',0)
    set(handles.wheatFlourRadioBtn,'value',0)
    
    set(handles.exchangeRadioBtn,'value',0) 
    set(handles.qualifiedRadioBtn,'value',0)
    set(handles.nonQualifiedRadioBtn,'value',0)
    set(handles.fuelRadioBtn,'value',0)
end
item ='Rice (low quality) - Retail';
assignin('base', 'item', item)


% Hint: get(hObject,'Value') returns toggle state of riceRadioBtn


% --- Executes on button press in breadRadioBtn.
function breadRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to breadRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.riceRadioBtn,'value',0)
    set(handles.wheatRadioBtn,'value',0)
    set(handles.liveStockRadioBtn,'value',0)
    set(handles.wheatFlourRadioBtn,'value',0)
        
    
    set(handles.exchangeRadioBtn,'value',0) 
    set(handles.qualifiedRadioBtn,'value',0)
    set(handles.nonQualifiedRadioBtn,'value',0)
    set(handles.fuelRadioBtn,'value',0)
end
item ='Bread - Retail';
assignin('base', 'item', item)
% Hint: get(hObject,'Value') returns toggle state of breadRadioBtn


% --- Executes on button press in wheatRadioBtn.
function wheatRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to wheatRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.riceRadioBtn,'value',0)
    set(handles.breadRadioBtn,'value',0)
    set(handles.liveStockRadioBtn,'value',0)
    set(handles.wheatFlourRadioBtn,'value',0)
    
    
    set(handles.exchangeRadioBtn,'value',0) 
    set(handles.qualifiedRadioBtn,'value',0)
    set(handles.nonQualifiedRadioBtn,'value',0)
    set(handles.fuelRadioBtn,'value',0)
end
item ='Wheat - Retail';
assignin('base', 'item', item)
    
        
% Hint: get(hObject,'Value') returns toggle state of wheatRadioBtn


% --- Executes on button press in liveStockRadioBtn.
function liveStockRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to liveStockRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.wheatFlourRadioBtn,'value',0)
    set(handles.riceRadioBtn,'value',0)
    set(handles.breadRadioBtn,'value',0)
    set(handles.wheatRadioBtn,'value',0)
    
    
    set(handles.exchangeRadioBtn,'value',0) 
    set(handles.qualifiedRadioBtn,'value',0)
    set(handles.nonQualifiedRadioBtn,'value',0)
    set(handles.fuelRadioBtn,'value',0)
end
item ='Livestock (sheep, one-year-old alive female) - Retail';
assignin('base', 'item', item)

% Hint: get(hObject,'Value') returns toggle state of liveStockRadioBtn


% --- Executes on button press in qualifiedRadioBtn.
function qualifiedRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to qualifiedRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.nonQualifiedRadioBtn,'value',0)
    set(handles.fuelRadioBtn,'value',0)
    set(handles.exchangeRadioBtn,'value',0)
    
    set(handles.riceRadioBtn,'value',0)
    set(handles.breadRadioBtn,'value',0)
    set(handles.wheatRadioBtn,'value',0)
    set(handles.liveStockRadioBtn,'value',0)
    set(handles.wheatFlourRadioBtn,'value',0)
    
    
    
    
end
item ='Wage (qualified labour) - Retail';
assignin('base', 'item', item)

% Hint: get(hObject,'Value') returns toggle state of qualifiedRadioBtn


% --- Executes on button press in nonQualifiedRadioBtn.
function nonQualifiedRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to nonQualifiedRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.qualifiedRadioBtn,'value',0)
     set(handles.fuelRadioBtn,'value',0)
    set(handles.exchangeRadioBtn,'value',0)
    
    set(handles.riceRadioBtn,'value',0)
    set(handles.breadRadioBtn,'value',0)
    set(handles.wheatRadioBtn,'value',0)
    set(handles.liveStockRadioBtn,'value',0)
    set(handles.wheatFlourRadioBtn,'value',0)
    
end
item ='Wage (non-qualified labour, non-agricultural) - Retail';
assignin('base', 'item', item)
% Hint: get(hObject,'Value') returns toggle state of nonQualifiedRadioBtn


% --- Executes on button press in wheatFlourRadioBtn.
function wheatFlourRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to wheatFlourRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get(hObject, 'value');
if (val1 == 1)
    set(handles.riceRadioBtn,'value',0)
    set(handles.breadRadioBtn,'value',0)
    set(handles.wheatRadioBtn,'value',0)
    set(handles.liveStockRadioBtn,'value',0)
    
    set(handles.qualifiedRadioBtn,'value',0)
     set(handles.fuelRadioBtn,'value',0)
    set(handles.exchangeRadioBtn,'value',0)
    set(handles.nonQualifiedRadioBtn,'value',0)
    
    
end
item ='Wheat flour - Retail';
assignin('base', 'item', item)


    
% Hint: get(hObject,'Value') returns toggle state of wheatFlourRadioBtn


% --- Executes on button press in plotBtn.
function plotBtn_Callback(hObject, eventdata, handles)
% hObject    handle to plotBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    item = evalin('base', 'item')
    Data = evalin('base','year');
    dataTable = any(strcmp(Data.cmname,item),2);
    dataTable = Data(dataTable,:);
    
    dataUiTable = table2cell(dataTable)
    set(handles.table1, 'ColumnName', {'Data', 'Item Name', 'Unit', 'Category', 'Price','Province'})
    set(handles.table1, 'Data', dataUiTable)
    
    
    City1 = any(strcmp(dataTable.admname,'Kabul'),2);
    Kabul = (dataTable(City1,:));
    Kabul = mean(Kabul.price);
    City2 = any(strcmp(dataTable.admname,'Badakhshan'),2);
    Badakhshan = (dataTable(City2,:));
    Badakhshan = mean(Badakhshan.price);
    City3 = any(strcmp(dataTable.admname,'Faryab'),2);
    Faryab = (dataTable(City3,:));
    Faryab = mean(Faryab.price);
    City4 = any(strcmp(dataTable.admname,'Ghor'),2);
    Ghor = (dataTable(City4,:));
    Ghor = mean(Ghor.price);
    City5 = any(strcmp(dataTable.admname,'Hirat'),2);
    Hirat = (dataTable(City5,:));
    Hirat = mean(Hirat.price);
    City6 = any(strcmp(dataTable.admname,'Nangarhar'),2);
    Nangarhar = (dataTable(City6,:));
    Nangarhar = mean(Nangarhar.price);
    City7 = any(strcmp(dataTable.admname,'Daykundi'),2);
    Daykundi = (dataTable(City7,:));
    Daykundi = mean(Daykundi.price);
    City8 = any(strcmp(dataTable.admname,'Kandahar'),2);
    Kandahar = (dataTable(City8,:));
    Kandahar = mean(Kandahar.price);
    
    plot = [Kabul Badakhshan Ghor Hirat Nangarhar Daykundi Faryab Kandahar];
    provinces = {'Kabul', 'Badakhshan', 'Ghor', 'Hirat', 'Nangarhar', 'Daykundi', 'Faryab', 'Kandahar'};
    axes(handles.axes1)
    bar(plot,'grouped')
    title(unique(dataTable.cmname))
    set(gca,'XTickLabel',provinces,'Fontsize',9)
    xtickangle(45)
    xlabel('Provinces','FontWeight','Bold')
    ylabel('Price','FontWeight','Bold')
    legend('Price')

    ylim([0 max(plot)+10])


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotScatterBtn.
function plotScatterBtn_Callback(hObject, eventdata, handles)
% hObject    handle to plotScatterBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DataYear = evalin('base','AllYear');
    ItemsData = evalin('base','Items');
    ind = get(handles.listbox1,'value')

    
for i = 1:length(ItemsData)
    
   if(i == ind)
       ItemsData = ItemsData{i}   
   end

end
    Index = any(strcmp(DataYear.cmname, ItemsData),2);
    Data = DataYear(Index,:)
    assignin('base','scatter',Data)
    
    rangeMin2015 = datenum('1/1/2015');
    rangeMax2015 = datenum('12/31/2015');
    index15 = find(Data.date >= rangeMin2015 & Data.date <= rangeMax2015);
    year15 = Data.price(index15)
    assignin('base','sc15',year15)
    
    rangeMin2016 = datenum('1/1/2016');
    rangeMax2016 = datenum('12/31/2016');
    index16 = find(Data.date >= rangeMin2016 & Data.date <= rangeMax2016);
    year16 = Data.price(index16)
    
    rangeMin2017 = datenum('1/1/2017');
    rangeMax2017 = datenum('12/31/2017');
    index17 = find(Data.date >= rangeMin2017 & Data.date <= rangeMax2017);
    year17 = Data.price(index17)
    
    rangeMin2018 = datenum('1/1/2018');
    rangeMax2018 = datenum('12/31/2018');
    index18 = find(Data.date >= rangeMin2018 & Data.date <= rangeMax2018);
    year18 = Data.price(index18)
    
    rangeMin2019 = datenum('1/1/2019');
    rangeMax2019 = datenum('12/31/2019');
    index19 = find(Data.date >= rangeMin2019 & Data.date <= rangeMax2019);
    assignin('base','index19',index19)
    year19 = Data.price(index19)
    assignin('base','year19',year19)
    
    axes(handles.axes2)
    cla
    scatter(index15,year15,15,'rd','filled')
    hold on
    scatter(index16,year16,15,'gsquare','filled')
    scatter(index17,year17,15,'bd','filled')
    scatter(index18,year18,15,'ko','filled')
    scatter(index19,year19,15,'yd','filled')
    
    legend('2015','2016','2017','2018','2019')
    xlabel('Price Yearly Variance Index')
    ylabel('Price')
    set(gca,'Fontsize',9,'FontWeight','Bold')
    axis('tight')
    grid('minor')

% --- Executes on button press in allYearRdBtn.
function allYearRdBtn_Callback(hObject, eventdata, handles)
% hObject    handle to allYearRdBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    DataDate = evalin('base','data');
    rangeMin = datenum('1/1/2015');
    rangeMax = datenum('12/31/2019');
    index = find(DataDate.date >= rangeMin & DataDate.date <= rangeMax);
    allYear = DataDate(index,:);
    assignin('base','AllYear',allYear); 
    assignin('base','AllYear',allYear); 
    Items = cellstr(allYear.cmname);
    Items = unique(Items);
    assignin('base','Items',Items);
set(handles.listbox1,'string',Items);

% Hint: get(hObject,'Value') returns toggle state of allYearRdBtn
