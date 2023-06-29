function [X,Y]=AI(Box)
X=0; Y=0; 
%---------------------------------------- 
count=0;
for ii=1:5
   if Box(ii,ii)==1
       count=count+1;
   end
   if count==4, 
       [X Y]=find(diag(Box)==0);  
       X=X; Y=ii;
       if (X~=0 & Y~=0) return; end
       %if (Box(X,Y)==0) return; end
   end
end
%----------------------------------------   
count=0;
for ii=1:5
   if Box(ii,6-ii)==1
       count=count+1;
   end
   if count==4, 
       [X Y]=find(diag(rot90(Box))==0); 
       X=X; Y=5-ii;
       if (X~=0 & Y~=0) return; end
   end
end
%----------------------------------------
for ii=1:5
    count=0;
    for jj=1:5
        if Box(ii,jj)==1
            count=count+1;
        end
        if count==4, 
            [X Y]=find(Box(ii,:)==0);
            X=ii; Y=Y;
            if (X~=0 & Y~=0) return; end
        end
    end   
end
%---------------------------------------- 
for ii=1:5
    count=0;
    for jj=1:5
        if Box(jj,ii)==1
            count=count+1;
        end  
        if count==4, 
            [X Y]=find(Box(:,ii)==0); 
            X=X; Y=ii;
            if (X~=0 & Y~=0) return; end
        end
    end    
end
%---------------------------------------- 