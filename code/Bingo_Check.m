function [bingo]=Bingo_Check(Box)
count=0;
bingo=0;
%----------------------------------------     
for ii=1:5
    count=0;
    for jj=1:5
        if Box(ii,jj)==1
            count=count+1;
        end
        if count==5, bingo=bingo+1; end
    end   
end
%---------------------------------------- 
for ii=1:5
    count=0;
    for jj=1:5
        if Box(jj,ii)==1
            count=count+1;
        end  
        if count==5, bingo=bingo+1; end
    end    
end
%----------------------------------------    
count=0;
for ii=1:5
   if Box(ii,ii)==1
       count=count+1;
   end
   if count==5, bingo=bingo+1; end
end
%----------------------------------------   
count=0;
for ii=1:5
   if Box(ii,6-ii)==1
       count=count+1;
   end
   if count==5, bingo=bingo+1; end
end
%----------------------------------------