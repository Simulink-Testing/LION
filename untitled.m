try
    
        slx_name = strcat(loc,'/',filename{1});
        simargs.SimulationMode='normal';
        simout = sim(slx_name, simargs);
        logsout = simout.get('logsout');
        % 加速模型仿真
        simargs.SimulationMode='accelerator';
        accsimout = sim(slx_name, simargs);
        acclogsout = accsimout.get('logsout');
        % 结果比较
        numElementsnormal = numElements(logsout);
        numElementsacc = numElements(acclogsout);
        % 首先比较他们的元素个数elements
        if numElementsnormal ~= numElementsacc
            fwrite(f,'numElement not match!!');
            fprintf(f,'\r\n');
            fwrite(f,slx_name);
            fprintf(f,'\r\n');
            % 移动记录
            movefile(slx_name,"bugsave/");
        else
            for w=1:numElementsacc
                element = logsout.getElement(w);
                accelement = acclogsout.getElement(w);
                normalresult.data = element.Values.Data;
                normalresult.time = element.Values.Time;
                accnormalresult.data = accelement.Values.Data;
                accnormalresult.time = accelement.Values.Time;
                % 判断数据data的数量是否一致
                if numel(normalresult.data) ~= numel(accnormalresult.data)
                    blockpath = convertToCell(element.BlockPath);
                    fwrite(f,'numelofdata not match!!');
                    fprintf(f,'\r\n');
                    fwrite(f,slx_name);
                    fprintf(f,'\r\n');
                    fwrite(f,blockpath{1});
                    fprintf(f,'\r\n');
                    fwrite(f,int2str(numel(normalresult.data)));
                    fprintf(f,'\r\n');
                    fwrite(f,int2str(numel(accnormalresult.data)));
                    fprintf(f,'\r\n');
                    % 移动记录
                    movefile(slx_name,"bugsave/");
                    break;
                else
                    % 判断数据data的各个量是否一致
                    for j=1:numel(normalresult.data)
                        if normalresult.data(j) ~= accnormalresult.data(j)
                            if isnan(normalresult.data(j)) && isnan(accnormalresult.data(j))
                            else
                                fwrite(f,'data mismatch!!');
                                fprintf(f,'\r\n');
                                fwrite(f,int2str(normalresult.data));
                                fwrite(f,int2str(accnormalresult.data));
                                fprintf(f,'\r\n');
                                fwrite(f,slx_name);
                                fprintf(f,'\r\n');
                                % 移动记录
                                movefile(slx_name,"bugsave/");
                            end
                        end
                    end
                end
                % 判断数据time的数量是否一致
                if numel(normalresult.time) ~= numel(accnormalresult.time)
                    fwrite(f,'numeloftime not match!!');
                    fprintf(f,'\r\n');
                    fwrite(f,slx_name);
                    fprintf(f,'\r\n');
                    % 移动记录
                    movefile(slx_name,"bugsave/");
                else
                    % 判断数据time的各个量是否一致
                    for k=1:numel(normalresult.time)
                        if normalresult.time(k) ~= accnormalresult.time(k)
                            fwrite(f,'time mismatch!!');
                            fprintf(f,'\r\n');
                            fwrite(f,slx_name);
                            fprintf(f,'\r\n');
                            % 移动记录
                            movefile(slx_name,"bugsave/");
                        end
                    end
                end
            end
        end
        disp('本轮结束');
        close_system(slx_name);
    catch e
        disp('异常结束');
        disp(e.message);
        fwrite(f,'异常结束!');
        fprintf(f,'\r\n');
        fwrite(f,slx_name);
        fprintf(f,'\r\n');
        fwrite(f,e.message);
        fprintf(f,'\r\n');
        % 移动记录
        try
            movefile(slx_name,"bugsave/");
        catch e
            disp(e);
        end
        % 关掉程序
        close_system(slx_name);
        continue;
    end
    % 把文件移到已运行的
    try
        movefile(slx_name,"expset/done/");
    catch e
        disp(e);
    end