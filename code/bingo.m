function Bingo
%--------------------------------------------------------------------------
% about the game
clc
disp('          GAME->Bingo')
disp('')
disp('')
disp('DESCRIPTION:')
disp('')
disp('')
disp('1. The 5X5 board is filled with numbers 1 to 25.')
disp('2. A move consists in selecting a number by one of the player and ticking in both the boards.')
disp('3. One complete(total 5) row (or) column(or) diagonal will count a point.')
disp('4. "Bingo" is displayed(after accumulating 5 points).')
pause(2);
%--------------------------------------------------------------------------
% defining the boards
CPU_Board=reshape(randperm(25),5,5);
UUU_Board=reshape(randperm(25),5,5);
UUU_Box=zeros(5,5);
CPU_Box=zeros(5,5);
%--------------------------------------------------------------------------
%drawing the board
Update_Board(UUU_Box,UUU_Board);
%--------------------------------------------------------------------------
%game begins
clc
disp('           Press "0" for UUU to START');
disp('                          OR');
disp('           Press "1" for CPU to START');
turn=input('');
bye=0;
step=1;
while step~=0     
%--------------------------------------------------------------------------
%user move
if (mod(turn,2)==0 & step~=0)
    clc
    disp('                UUUs TURN...');
    disp('        Select the Number...');
    valid=0;win=0;
    
    while valid==0
        set(gcf,'pointer','fleur');
        [Xnew Ynew Button] = ginput(1);
        %checking for correct button
        if Button~=1    bye=1;  close;  break;  end
        
        if Button==1
           Xnew=1+floor(Xnew);
           Ynew=1+floor(Ynew);
            %checking for the validity of position            
            if (Xnew>0 & Xnew<6 & Ynew>0 & Ynew<6)
               if UUU_Box(Xnew,Ynew)==1  
                  %cheking for the repitition
                  disp('           Please check ur move...');
                  continue;
               end       
            end
            valid=1;
            %freezing the UUU_move
            UUU_Box(Xnew,Ynew)=1;
            %freezing the coresponding CPU_move
            [Xnew Ynew]=find(CPU_Board==UUU_Board(Xnew,Ynew));
            CPU_Box(Xnew,Ynew)=1;  
            clf
            Update_Board(UUU_Box,UUU_Board);
            win=Bingo_Check(UUU_Box);
            if win==5, 
                UUU(CPU_Box,CPU_Board,UUU_Box,UUU_Board); 
                return;
            end
            win=Bingo_Check(CPU_Box);
            if win==5, 
                CPU(CPU_Box,CPU_Board,UUU_Box,UUU_Board);
                return; 
            end
        end
    end
    turn=turn+1;
end
          %----------------------------------------------------
          
if (mod(turn,2)==1 & step~=0)
    clc   
    disp('                CPUs TURN...');    
    win=0;
    Check_Box=CPU_Box;
    while CPU_Box==Check_Box%final check
    valid=0;
    %Little Artificial Intelligence   
    [Xnew,Ynew]=AI(CPU_Box);
    if (Xnew>0 & Xnew<6 & Ynew>0 & Ynew<6), valid=1; end
    %No Artificial Intelligence   
        while valid==0
            Xnew=1+mod(fix(10*rand(1,1)),5);
            Ynew=1+mod(fix(10*rand(1,1)),5);
            if CPU_Box(Xnew,Ynew)==0  
                 valid=1;
            end
        end
%     end         
    
    CPU_Box(Xnew,Ynew)=1;
    end
    disp('        I Have Selected the Number...');  
    pause(1.5);
    [Xnew Ynew]=find(UUU_Board==CPU_Board(Xnew,Ynew));
    UUU_Box(Xnew,Ynew)=1;     
    clf
    Update_Board(UUU_Box,UUU_Board);
    win=Bingo_Check(CPU_Box);
    
    if win==5,       
       CPU(CPU_Box,CPU_Board,UUU_Box,UUU_Board);
       return;
    end
    win=Bingo_Check(UUU_Box);
    if win==5, 
       UUU(CPU_Box,CPU_Board,UUU_Box,UUU_Board);
       return; 
    end
    turn=turn+1;
end
end
%--------------------------------------------------------------------------