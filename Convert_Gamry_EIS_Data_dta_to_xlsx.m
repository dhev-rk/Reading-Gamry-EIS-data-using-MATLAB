%This script copies EIS data from Gamry which has file extension as .dta files to xlsx files

clear,clc,close all

folder_in = 'C:\Users\Random\Desktop\My Files\1_Cell_Test_Lab\2_Gamry\EIS Data\FolderName'; %Provide link to the folder with the EIS data


dtafiles = dir(fullfile(folder_in, '**/*filename*.dta'));  %get list of files and folders in any subfolder
dtafiles = dtafiles(~[dtafiles.isdir]); 

[~,idx] = sort([dtafiles.datenum]);
dtafiles5 = dtafiles(idx);

dtafiles2 = struct2table(dtafiles);

last_mod_date = datenum ('05/20/2026', 'mm/dd/yyyy'); %Get files only after specific date assuming that previuous ones are alreday processed

dtafiles3 = dtafiles2(dtafiles2.datenum > last_mod_date, :);


dtafiles4 = removevars(dtafiles3, {'date', 'bytes', 'isdir'});
dtafullfile = dtafiles4;


dtafullfile.name = strcat(dtafullfile.folder, '\', dtafullfile.name);
dtafullfilename = dtafullfile.name;

%Just filename and removing the unwanted columns
justfilename = removevars(dtafiles3, {'folder', 'date', 'bytes', 'datenum', 'isdir'});

%Converting file list cell to able and then to struct to use it in for loop
dtafilelisttable = cell2table(dtafullfilename);
dtafilenamesstruct = table2struct(dtafilelisttable);

newfilename = [];
for i=1:height(justfilename)
    filename = justfilename.name(i);
    newfilename1 = strrep(filename,'.DTA','.xlsx');
    newfilename = [newfilename; newfilename1]; 
end

newfilename_table = cell2table(newfilename);
newfilename_struct = table2struct(newfilename_table);

%take part of string from justfilename and change dta to xlsx
for i=1:height(justfilename)
    dtadata = readtable(dtafilenamesstruct(i).dtafullfilename, 'FileType', 'text', 'Delimiter', '\t', 'HeaderLines', 175, 'ReadVariableNames', true);
    writetable(dtadata,newfilename_struct(i).newfilename,'Sheet',1)
%     save (newfilename_struct(i).newfilename, 'dtadata');
end


