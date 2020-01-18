k= [] ; i =1 ; l= [] ; t= 1 ; errorcounter = 0 ; n=1; j =1 ; o=[]; 
while (i>0)
    [data,timestamp] = readAcceleration(BNO055Sensor) ;
    k(i,1) = round(data(1),2) ; k(i,2) = round(data(2),2) ; k(i,3) = round(data(3),2) ; 
    o(j,1) = round(data(1),2) ; o(j,2) = round(data(2),2) ; o(j,3) = round(data(3),2) ; 
    try 
        [data,timestamp] = readAngularVelocity(BNO055Sensor) ;
        k(i,4) = round(data(1),2) ; k(i,5) = round(data(2),2) ; k(i,6) = round(data(3),2) ; 
        o(j,4) = round(data(1),2) ; o(j,5) = round(data(2),2) ; o(j,6) = round(data(3),2) ; 
    catch
        errorcounter = errorcounter + 1 ; 
        k(i,4) = k((i-1),4) ; k(i,5) = k((i-1),5) ; k(i,6) = k((i-1),6) ; 
        o(j,4) = o((j-1),4) ; o(j,5) = o((j-1),5) ; o(j,6) = o((j-1),6) ; 
    end    
    pause(.05);
    if ((mod(i,80) == 0) && (i>=80))
        if (n==0)
            dlmwrite('test.csv',o,'delimiter',',','-append');
        end 
        if (n==1)
            dlmwrite('test.csv',o,'delimiter',',');
            n=0 ; 
        end
        fclose('all') ; 
        t= t +10 ; 
        o = [ ] ; j= 0 ; 
    end
    i= i+1 ;   
    j= j+1 ; 
end