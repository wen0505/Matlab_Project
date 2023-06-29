function Update_Board(Box,Board)
%--------------------------------------------------------------------------
%drawing the board
for ii=0:4
    for jj=0:4
        rectangle('Position', [0+ii 0+jj 1 1]);
        X=[0+ii 1+ii 1+ii 0+ii];
        Y=[0+jj 0+jj 1+jj 1+jj];
        hold on  
        if Box(ii+1,jj+1)==0      fill(X,Y,'g');  end
        if Box(ii+1,jj+1)==1      fill(X,Y,'r');  end 
        text(ii+0.3,jj+0.5,sprintf('%d ',Board(ii+1,jj+1)),'color','k','fontsize',20);
        axis([0 5 0 5]);
    end   
end
axis off
title('Player Board','fontsize',20,'color','m');
%--------------------------------------------------------------------------