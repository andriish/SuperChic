ccc   strong coupling constant, for PDFINPUT = LHAPDF
      function alphas(qsq)
      implicit double precision (a-z)

      if (qsq.le.1.d0) then 
      write(*,*)'Error in alphas.f qsq=',qsq
      alphas=alphasPDF(1.0d0)
      else
      alphas=alphasPDF(dsqrt(qsq))
      end if

      return
      end
