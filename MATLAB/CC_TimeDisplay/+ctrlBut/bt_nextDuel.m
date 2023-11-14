function bt_nextDuel(src,callbackdata)

    data = guidata(src.Parent);     
    set(findall(0,'Tag','lblTimeOneDODuelDisp'),'FontColor', [0.7,0.7,0.7]);
    set(findall(0,'Tag','lblTimeTwoDODuelDisp'),'FontColor', [0.7,0.7,0.7]);
    set(findall(0,'Tag','lblTimeThreeDODuelDisp'),'FontColor', [0.7,0.7,0.7]);
    set(findall(0,'Tag','lblTimeOneDTDuelDisp'),'FontColor', [0.7,0.7,0.7]);
    set(findall(0,'Tag','lblTimeTwoDTDuelDisp'),'FontColor', [0.7,0.7,0.7]);
    set(findall(0,'Tag','lblTimeThreeDTDuelDisp'),'FontColor', [0.7,0.7,0.7]);
    
    if isempty(data.TNData)
        errordlg(['No Data loaded!']);
    else               
           if (data.bFreilos && (data.idx == 1))  
               data.idx = data.idx + 1;
               data.duel = data.duel + 1;
               set(findall(src.Parent,'Tag','lblDO'),'Text',data.TNData.Teamname(data.idx));
               set(findall(src.Parent,'Tag','rndOneDO'),'Value',string(data.TNData.firRndBO(data.idx)));        
               set(findall(src.Parent,'Tag','rndTwoDO'),'Value',string(data.TNData.secRndBO(data.idx))); 
               set(findall(src.Parent,'Tag','rndThreeDO'),'Value',string(data.TNData.thiRndBO(data.idx)));
               set(findall(src.Parent,'Tag','MeterOneDO'),'Value',num2str(data.TNData.firRndBOMT(data.idx)));        
               set(findall(src.Parent,'Tag','MeterTwoDO'),'Value',num2str(data.TNData.secRndBOMT(data.idx))); 
               set(findall(src.Parent,'Tag','MeterThreeDO'),'Value',num2str(data.TNData.thiRndBOMT(data.idx))); 

               set(findall(src.Parent,'Tag','lblDT'),'Text',data.TNData.Teamname(data.idx+1));
               set(findall(src.Parent,'Tag','rndOneDT'),'Value',string(data.TNData.firRndBO(data.idx+1)));        
               set(findall(src.Parent,'Tag','rndTwoDT'),'Value',string(data.TNData.secRndBO(data.idx+1))); 
               set(findall(src.Parent,'Tag','rndThreeDT'),'Value',string(data.TNData.thiRndBO(data.idx+1)));
               set(findall(src.Parent,'Tag','MeterOneDT'),'Value',num2str(data.TNData.firRndBOMT(data.idx+1)));        
               set(findall(src.Parent,'Tag','MeterTwoDT'),'Value',num2str(data.TNData.secRndBOMT(data.idx+1))); 
               set(findall(src.Parent,'Tag','MeterThreeDT'),'Value',num2str(data.TNData.thiRndBOMT(data.idx+1)));
               set(findall(src.Parent,'Tag','duelCnt'),'Text',num2str(data.duel)); 

               set(findall(0,'Tag','lblDODuelDisp'),'Text',data.TNData.Teamname(data.idx));
               set(findall(0,'Tag','imagDODisp'),'ImageSource',data.TNData.PictureUrl{data.idx});
               set(findall(0,'Tag','lblDTDuelDisp'),'Text',data.TNData.Teamname(data.idx+1));
               set(findall(0,'Tag','imagDTDisp'),'ImageSource',data.TNData.PictureUrl{data.idx+1});
               set(findall(0,'Tag','lblTimeOneDODuelDisp'),'Text',string(data.TNData.firRndBO(data.idx)));
               set(findall(0,'Tag','lblTimeTwoDODuelDisp'),'Text',string(data.TNData.secRndBO(data.idx)));
               set(findall(0,'Tag','lblTimeThreeDODuelDisp'),'Text',string(data.TNData.thiRndBO(data.idx)));
               set(findall(0,'Tag','lblTimeOneDTDuelDisp'),'Text',string(data.TNData.firRndBO(data.idx+1)));
               set(findall(0,'Tag','lblTimeTwoDTDuelDisp'),'Text',string(data.TNData.secRndBO(data.idx+1)));
               set(findall(0,'Tag','lblTimeThreeDTDuelDisp'),'Text',string(data.TNData.thiRndBO(data.idx+1)));
            
               set(findall(0,'Tag','imagDTDisp'),'Visible','on');
           else                       
               if(data.idx+2 < size(data.TNData,1))
                    data.idx = data.idx + 2;
                    data.duel = data.duel + 1;
               end
               set(findall(src.Parent,'Tag','lblDO'),'Text',data.TNData.Teamname(data.idx));
               set(findall(src.Parent,'Tag','rndOneDO'),'Value',string(data.TNData.firRndBO(data.idx)));        
               set(findall(src.Parent,'Tag','rndTwoDO'),'Value',string(data.TNData.secRndBO(data.idx))); 
               set(findall(src.Parent,'Tag','rndThreeDO'),'Value',string(data.TNData.thiRndBO(data.idx)));
               set(findall(src.Parent,'Tag','MeterOneDO'),'Value',num2str(data.TNData.firRndBOMT(data.idx)));        
               set(findall(src.Parent,'Tag','MeterTwoDO'),'Value',num2str(data.TNData.secRndBOMT(data.idx))); 
               set(findall(src.Parent,'Tag','MeterThreeDO'),'Value',num2str(data.TNData.thiRndBOMT(data.idx))); 
               set(findall(src.Parent,'Tag','lblDT'),'Text',data.TNData.Teamname(data.idx+1));
               set(findall(src.Parent,'Tag','rndOneDT'),'Value',string(data.TNData.firRndBO(data.idx+1)));        
               set(findall(src.Parent,'Tag','rndTwoDT'),'Value',string(data.TNData.secRndBO(data.idx+1))); 
               set(findall(src.Parent,'Tag','rndThreeDT'),'Value',string(data.TNData.thiRndBO(data.idx+1)));
               set(findall(src.Parent,'Tag','MeterOneDT'),'Value',num2str(data.TNData.firRndBOMT(data.idx+1)));        
               set(findall(src.Parent,'Tag','MeterTwoDT'),'Value',num2str(data.TNData.secRndBOMT(data.idx+1))); 
               set(findall(src.Parent,'Tag','MeterThreeDT'),'Value',num2str(data.TNData.thiRndBOMT(data.idx+1)));
               set(findall(src.Parent,'Tag','duelCnt'),'Text',num2str(data.duel));  

               set(findall(0,'Tag','lblDODuelDisp'),'Text',data.TNData.Teamname(data.idx));
               set(findall(0,'Tag','imagDODisp'),'ImageSource',data.TNData.PictureUrl{data.idx});
               set(findall(0,'Tag','lblTimeOneDODuelDisp'),'Text',string(data.TNData.firRndBO(data.idx)));
               set(findall(0,'Tag','lblTimeTwoDODuelDisp'),'Text',string(data.TNData.secRndBO(data.idx)));
               set(findall(0,'Tag','lblTimeThreeDODuelDisp'),'Text',string(data.TNData.thiRndBO(data.idx)));

               set(findall(0,'Tag','lblDTDuelDisp'),'Text',data.TNData.Teamname(data.idx+1));
               set(findall(0,'Tag','imagDTDisp'),'ImageSource',data.TNData.PictureUrl{data.idx+1});
               set(findall(0,'Tag','lblTimeOneDTDuelDisp'),'Text',string(data.TNData.firRndBO(data.idx+1)));
               set(findall(0,'Tag','lblTimeTwoDTDuelDisp'),'Text',string(data.TNData.secRndBO(data.idx+1)));
               set(findall(0,'Tag','lblTimeThreeDTDuelDisp'),'Text',string(data.TNData.thiRndBO(data.idx+1)));
            
               set(findall(0,'Tag','imagDTDisp'),'Visible','on');
           end 

            switch src.Parent.Tag
                
                case 'BlockOne'
                    TNData = data.TNData;
                    save TNDataBOne TNData  
                case 'BlockTwo'
                    TNData = data.TNData;
                    save TNDataBTwo TNData  
                case 'QuarterFinal'
                    load('TNDataQF.mat','TNDataRest');
                    TNData = data.TNData;
                    save TNDataQF TNData TNDataRest
                case 'SemiFinal'
                    load('TNDataSF.mat','TNDataRest');
                    TNData = data.TNData;
                    save TNDataSF TNData TNDataRest
                case 'SmallFinal'
                    load('TNDatakF.mat','TNDataRest');
                    TNData = data.TNData;
                    save TNDatakF TNData TNDataRest
                case 'Final'
                    load('TNDataFIN.mat','TNDataRest');
                    TNData = data.TNData;
                    save TNDatakFIN TNData TNDataRest
            end
    end

    guidata(src,data);
    drawnow;  

end