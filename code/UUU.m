function UUU(CPU_Box,CPU_Board,UUU_Box,UUU_Board)
       step=0; 
       disp('UUU won the game...');
       
       figure(1);
       Update_Board(CPU_Box,CPU_Board); 
       hold on
       title('CPU Board','color','w','fontsize',20);
       
       figure(2);
       Update_Board(UUU_Box,UUU_Board);
       hold on
       title('Player Board','color','w','fontsize',20);