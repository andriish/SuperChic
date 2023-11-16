ccc   gg --> pipi subprocess amplitude (x,y dependent)
      subroutine pipixy(x,y,cost,out)
      implicit none
      double precision x,y,out,cost,a,b
      double precision b2,c2 
       
      a= 1d0-x-y+2*x*y
      b= 1d0-x-y
      b2 = b**2
      c2 = cost**2

      out=c2-8d0/9d0*a
      out=out*(a-b2)/(a**2-b2*c2)

      return
      end

