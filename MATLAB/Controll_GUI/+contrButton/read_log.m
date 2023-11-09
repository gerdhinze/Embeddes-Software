function read_log()
    
    save('datalog.mat');
    
    if isvalid(esp1)
    fprintf(esp1, 'read_log');
    pause(0.5);
    while ESP1.NumBytesAvailable > 0
        data_log = fscanf(esp1, '%s');
        % Den String in seine Bestandteile aufteilen
        splitstring = strsplit(data_log, ' ');

        datenStruktur.Wert1 = str2double(geteilteWerte{1});
        datenStruktur.Wert2 = str2double(geteilteWerte{2});
        datenStruktur.Wert3 = str2double(geteilteWerte{3});
        datenStruktur.Wert4 = str2double(geteilteWerte{4});
        datenStruktur.Wert5 = str2double(geteilteWerte{5});
        
    end
    elseif isvalid(esp2)
    fprintf(esp2, 'read_log');
    pause(0.5);
    while ESP2.NumBytesAvailable > 0
        time_esp2 = fscanf(esp2, '%s');
    end
    elseif isvalid(esp3)
    fprintf(esp3, 'read_log');
    pause(0.5);
    while ESP3.NumBytesAvailable > 0
        time_esp3 = fscanf(esp3, '%s');
    end
    end
end

