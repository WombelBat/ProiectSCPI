function [tseta] = tseta_fun(delta)
    temp =log( delta/100 )^2;
    tseta = sqrt( ( temp ) / ( pi^2 -temp ));

end