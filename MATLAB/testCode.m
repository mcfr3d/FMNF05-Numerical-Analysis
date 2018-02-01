%1
error_old =(b-a)/2;
error = 1;
counter = 0;

if (b-a)/2< 10^(-14) && (b-a)/2> 10^(-15)
    error_old =(b-a)/2;
    counter =1;
end
    
if counter == 1
    error = (b-a)/2;
end 
    
conv_rate = error/error_old;