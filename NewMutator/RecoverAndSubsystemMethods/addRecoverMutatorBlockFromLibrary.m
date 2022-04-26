function last_Outport = addRecoverMutatorBlockFromLibrary(Name,sys_path)
disp('addRecoverBlockFromLibrary');
% 每层最大生成块数
GEN_NUM = 1;
% 生成层数
GEN_DEEPTH = 5;
% 记录第一个块的名字
first_blk = Name;
% 获得Library中的所有块
all_blk_type = GetAllBlockFromLibrary();
% 根据层数生成
tree = {Name};
gen_num = randi(GEN_DEEPTH);
for i = 1:gen_num
    % 看看几个要生成的
    n_tree_list={};
    for j =1:length(tree)
        % 随机确定生成几个
        blk = tree{j};
        port = get_param(blk,'PortHandles');
        for w = 1:GEN_NUM
            nblk_Name = strcat(first_blk,'nzb','_',string(i),'_',string(j),'_',string(w));
            % 随机生成一个 or subsystem
            prob = rand(1);
            if prob >0.5
                new_blk = randomchoose(all_blk_type);
                add_block(new_blk,nblk_Name);
            else
                % 生成Subsystem 在里面接着生成各种
                add_block('simulink/Commonly Used Blocks/Subsystem',nblk_Name);
                addMutatorRandomBlockFromLibrary(nblk_Name);
            end
            n_port = get_param(nblk_Name,'PortHandles');
            % 判断一下有没有Inport口
            while isempty(n_port.Inport)
                delete_block(nblk_Name);
                new_blk = randomchoose(all_blk_type);
                nblk_Name = strcat(first_blk,'nzb','_',string(i),'_',string(j),'_',string(w));
                add_block(new_blk,nblk_Name);
                n_port = get_param(nblk_Name,'PortHandles');
            end
            % 添加线
            add_line(sys_path,port.Outport(1),n_port.Inport(1),'autorouting','on');
            n_tree_list{end+1} = nblk_Name(1,1);
        end
    end
    tree = n_tree_list;
    
end
% 随机选择块的方法
    function blk = randomchoose(all_blk_type)
        num = randi(length(all_blk_type));
        blk = all_blk_type{num};
    end
% 返回最后一个块的输出端口
last_blk = tree{1};
PortHandles = struct2table(get_param(last_blk, 'PortHandles'),'AsArray', true);
last_Outport = PortHandles.Outport;
end

