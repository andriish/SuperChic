      SUBROUTINE RAMBO(N,ET,XM,P,WT)
C------------------------------------------------------
C
C                       RAMBO
C
C    RA(NDOM)  M(OMENTA)  B(EAUTIFULLY)  O(RGANIZED)
C
C    A DEMOCRATIC MULTI-PARTICLE PHASE SPACE GENERATOR
C    AUTHORS:  S.D. ELLIS,  R. KLEISS,  W.J. STIRLING
C    THIS IS VERSION 1.0 -  WRITTEN BY R. KLEISS
C
C    N  = NUMBER OF PARTICLES (>1, IN THIS VERSION <101)
C    ET = TOTAL CENTRE-OF-MASS ENERGY
C    XM = PARTICLE MASSES ( DIM=100 )
C    P  = PARTICLE MOMENTA ( DIM=(4,100) )
C    WT = WEIGHT OF THE EVENT
C
C------------------------------------------------------
      implicit none
!     boost arguments
      integer n
      double precision et,xm(100),p(4,100),wt
!     function
      double precision rn
!     internal variables
      double precision q(4,100),z(100),r(4),
     &     b(3),p2(100),xm2(100),e(100),v(100)
      integer iwarn(5)
      double precision acc
      integer itmax,ibegin
      data acc/1.0d-14/,itmax/6/,ibegin/0/,iwarn/5*0/

      integer i,k,iter
      double precision twopi,po2log,xmt,c,s,f,rmas,g,a,x,bq,
     &     accu,f0,g0,wt2,wt3,wtm,x2,xmax
      integer nm
      save


C
C INITIALIZATION STEP: FACTORIALS FOR THE PHASE SPACE WEIGHT
      IF(IBEGIN.NE.0) GOTO 103
      IBEGIN=1
      TWOPI=8.*DATAN(1.D0)
      PO2LOG=DLOG(TWOPI/4.)
      Z(2)=PO2LOG
      DO 101 K=3,100
  101 Z(K)=Z(K-1)+PO2LOG-2.*DLOG(DFLOAT(K-2))
      DO 102 K=3,100
  102 Z(K)=(Z(K)-DLOG(DFLOAT(K-1)))
C
C CHECK ON THE NUMBER OF PARTICLES
  103 IF(N.GT.1.AND.N.LT.101) GOTO 104
      PRINT 1001,N
      STOP 1
C
C CHECK WHETHER TOTAL ENERGY IS SUFFICIENT; COUNT NONZERO MASSES
  104 XMT=0.
      NM=0
      DO 105 I=1,N
      IF(XM(I).NE.0.D0) NM=NM+1
  105 XMT=XMT+DABS(XM(I))
      IF(XMT.LE.ET) GOTO 201
      PRINT 1002,XMT,ET
      STOP 1
C
C THE PARAMETER VALUES ARE NOW ACCEPTED
C
C GENERATE N MASSLESS MOMENTA IN INFINITE PHASE SPACE
  201 DO 202 I=1,N
      C=2.*RN(1)-1.
      S=DSQRT(1.-C*C)
      F=TWOPI*RN(2)
      Q(4,I)=-DLOG(RN(3)*RN(4))
      Q(3,I)=Q(4,I)*C
      Q(2,I)=Q(4,I)*S*DCOS(F)
 202  Q(1,I)=Q(4,I)*S*DSIN(F)

C
C CALCULATE THE PARAMETERS OF THE CONFORMAL TRANSFORMATION
      DO 203 I=1,4
  203 R(I)=0.
      DO 204 I=1,N
      DO 204 K=1,4
  204 R(K)=R(K)+Q(K,I)
      RMAS=DSQRT(R(4)**2-R(3)**2-R(2)**2-R(1)**2)
      DO 205 K=1,3
  205 B(K)=-R(K)/RMAS
      G=R(4)/RMAS
      A=1./(1.+G)
      X=ET/RMAS
C
C TRANSFORM THE Q'S CONFORMALLY INTO THE P'S
      DO 207 I=1,N
      BQ=B(1)*Q(1,I)+B(2)*Q(2,I)+B(3)*Q(3,I)
      DO 206 K=1,3
  206 P(K,I)=X*(Q(K,I)+B(K)*(Q(4,I)+A*BQ))
  207 P(4,I)=X*(G*Q(4,I)+BQ)
C
C CALCULATE WEIGHT AND POSSIBLE WARNINGS
      WT=PO2LOG
      IF(N.NE.2) WT=(2.*N-4.)*DLOG(ET)+Z(N)
      IF(WT.GE.-180.D0) GOTO 208
      IF(IWARN(1).LE.5) PRINT 1004,WT
      IWARN(1)=IWARN(1)+1
  208 IF(WT.LE. 174.D0) GOTO 209
      IF(IWARN(2).LE.5) PRINT 1005,WT
      IWARN(2)=IWARN(2)+1
C
C RETURN FOR WEIGHTED MASSLESS MOMENTA
  209 IF(NM.NE.0) GOTO 210
      WT=DEXP(WT)
      RETURN
C
C MASSIVE PARTICLES: RESCALE THE MOMENTA BY A FACTOR X
  210 XMAX=DSQRT(1.-(XMT/ET)**2)
      DO 301 I=1,N
      XM2(I)=XM(I)**2
  301 P2(I)=P(4,I)**2
      ITER=0
      X=XMAX
      ACCU=ET*ACC
  302 F0=-ET
      G0=0.
      X2=X*X
      DO 303 I=1,N
      E(I)=DSQRT(XM2(I)+X2*P2(I))
      F0=F0+E(I)
  303 G0=G0+P2(I)/E(I)
      IF(DABS(F0).LE.ACCU) GOTO 305
      ITER=ITER+1
      IF(ITER.LE.ITMAX) GOTO 304
C      PRINT 1006,ITMAX,ACCU,DABS(F0)
      WRITE(99,1006)ITMAX,ACCU,DABS(F0)
      IF (DABS(F0).GT.1.0E-6) THEN
         WRITE(*,1007)DABS(F0)
      ENDIF
      GOTO 305
  304 X=X-F0/(X*G0)
      GOTO 302
  305 DO 307 I=1,N
      V(I)=X*P(4,I)
      DO 306 K=1,3
  306 P(K,I)=X*P(K,I)
  307 P(4,I)=E(I)
C
C CALCULATE THE MASS-EFFECT WEIGHT FACTOR
      WT2=1.
      WT3=0.
      DO 308 I=1,N
      WT2=WT2*V(I)/E(I)
  308 WT3=WT3+V(I)**2/E(I)
      WTM=(2.*N-3.)*DLOG(X)+DLOG(WT2/WT3*ET)
C
C RETURN FOR  WEIGHTED MASSIVE MOMENTA
      WT=WT+WTM
      IF(WT.GE.-180.D0) GOTO 309
      IF(IWARN(3).LE.5) PRINT 1004,WT
      IWARN(3)=IWARN(3)+1
  309 IF(WT.LE. 174.D0) GOTO 310
      IF(IWARN(4).LE.5) PRINT 1005,WT
      IWARN(4)=IWARN(4)+1
  310 WT=DEXP(WT)
      RETURN
C
 1001 FORMAT(' RAMBO FAILS: # OF PARTICLES =',I5,' IS NOT ALLOWED')
 1002 FORMAT(' RAMBO FAILS: TOTAL MASS =',D15.6,' IS NOT',
     . ' SMALLER THAN TOTAL ENERGY =',D15.6)
 1004 FORMAT(' RAMBO WARNS: WEIGHT = EXP(',F20.9,') MAY UNDERFLOW')
 1005 FORMAT(' RAMBO WARNS: WEIGHT = EXP(',F20.9,') MAY  OVERFLOW')
 1006 FORMAT(' RAMBO WARNS:',I3,' ITERATIONS DID NOT GIVE THE',
     . ' DESIRED ACCURACY =',D10.3,' (STOPS AT',D10.3,')')
 1007 FORMAT(' RAMBO WARNS: END OF ITERATION ACCURACY TOO LOW =',D10.3)
      END
C

      function rn(idum)
*
* SUBTRACTIVE MITCHELL-MOORE GENERATOR
* RONALD KLEISS - OCTOBER 2, 1987
*
* THE ALGORITHM IS N(I)=[ N(I-24) - N(I-55) ]MOD M,
* IMPLEMENTED IN A CIRUCULAR ARRAY WITH IDENTIFCATION
* OF NR(I+55) AND NR(I), SUCH THAT EFFECTIVELY:
*        N(1)   <---   N(32) - N(1)
*        N(2)   <---   N(33) - N(2)  ....
*   .... N(24)  <---   N(55) - N(24)
*        N(25)  <---   N(1)  - N(25) ....
*   .... N(54)  <---   N(30) - N(54)
*        N(55)  <---   N(31) - N(55)
*
* IN THIS VERSION  M =2**30  AND  RM=1/M=2.D0**(-30D0)
*
* THE ARRAY NR HAS BEEN INITIALIZED BY PUTTING NR(I)=I
* AND SUBSEQUENTLY RUNNING THE ALGORITHM 100,000 TIMES.
*

      implicit none
      double precision rn
      integer idum
      integer n(55)
      data n/
     . 980629335, 889272121, 422278310,1042669295, 531256381,
     . 335028099,  47160432, 788808135, 660624592, 793263632,
     . 998900570, 470796980, 327436767, 287473989, 119515078,
     . 575143087, 922274831,  21914605, 923291707, 753782759,
     . 254480986, 816423843, 931542684, 993691006, 343157264,
     . 272972469, 733687879, 468941742, 444207473, 896089285,
     . 629371118, 892845902, 163581912, 861580190,  85601059,
     . 899226806, 438711780, 921057966, 794646776, 417139730,
     . 343610085, 737162282,1024718389,  65196680, 954338580,
     . 642649958, 240238978, 722544540, 281483031,1024570269,
     . 602730138, 915220349, 651571385, 405259519, 145115737/
      double precision eps
      double precision rm
      integer j,k,l,m

      data eps/1D-9/
      data m/1073741824/
      data rm/0.9313225746154785D-09/
      data k/55/,l/31/


  1   CONTINUE
      IF(K.EQ.55) THEN
         K=1
      ELSE
         K=K+1
      ENDIF
      IF(L.EQ.55) THEN
         L=1
      ELSE
         L=L+1
      ENDIF
      J=N(L)-N(K)
      IF(J.LT.0) J=J+M
      N(K)=J
      RN=J*RM
      IF(RN.LT.EPS) GOTO 1
      IF(RN.GT.1D0-EPS) GOTO 1
      RETURN
      END
