1-4,5-7
1-5,6-7
1-5,6-8
1-5,6-11
1-4,5-9
1-4,5-11
1-4,5

 integer vertices(10,2)
 integer prodv(10)
 integer endv(10)
 bool found
 integer st,end
 nvert=3

  
 do i = st,end
    found = .FALSE.
    do j=1,nvert
     if (mothup(1,i) .eq. vertices(1,j) .and. mothup(2,i) .eq. vertices(2,j)) then
       prodv(i) = j
     endif
    done
    if ( .not. found )  then
      nvert = nvert +1
      prodv(i) = nvert
      vertices(1,nvert) = mothup(1,i)
      vertices(2,nvert) = mothup(2,i)
    endif
 done
 do i = 1,end
    do j = 1,end
       if  (i .ge. mothup(1,j) .and. i .le. mothup(2,j) ) then
         endv(i) = prodv(j)
       endif
    done
 done
