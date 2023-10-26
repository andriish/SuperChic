      SUBROUTINE SMATRIX_AU(P,ANS)
C     
C     Generated by MadGraph5_aMC@NLO v. 3.1.1, 2021-05-28
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     MadGraph5_aMC@NLO StandAlone Version
C     
C     Returns amplitude squared summed/avg over colors
C     and helicities
C     for the point in phase space P(0:3,NEXTERNAL)
C     
C     Process: a u > u w+ w- QCD=0 @1
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=5)
      INTEGER    NINITIAL
      PARAMETER (NINITIAL=2)
      INTEGER NPOLENTRIES
      PARAMETER (NPOLENTRIES=(NEXTERNAL+1)*6)
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=72)
      INTEGER HELAVGFACTOR
      PARAMETER (HELAVGFACTOR=4)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
CF2PY INTENT(OUT) :: ANS
CF2PY INTENT(IN) :: P(0:3,NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER NHEL(NEXTERNAL,NCOMB),NTRY
C     put in common block to expose this variable to python interface
      COMMON/PROCESS_NHEL_au/NHEL
      REAL*8 T
      REAL*8 MATRIX_AU
      INTEGER IHEL,IDEN, I, J
C     For a 1>N process, them BEAMTWO_HELAVGFACTOR would be set to 1.
      INTEGER BEAMS_HELAVGFACTOR(2)
      DATA (BEAMS_HELAVGFACTOR(I),I=1,2)/2,2/
      INTEGER JC(NEXTERNAL)
      LOGICAL GOODHEL(NCOMB)
      DATA NTRY/0/
      DATA GOODHEL/NCOMB*.FALSE./

C     
C     GLOBAL VARIABLES
C     
      INTEGER USERHEL
      COMMON/HELUSERCHOICE_au/USERHEL
      DATA USERHEL/-1/
      LOGICAL HELRESET_AU
      COMMON/HELRESET_AU/HELRESET_AU
      DATA HELRESET_AU/.TRUE./

      DATA (NHEL(I,   1),I=1,5) /-1, 1,-1,-1, 1/
      DATA (NHEL(I,   2),I=1,5) /-1, 1,-1,-1, 0/
      DATA (NHEL(I,   3),I=1,5) /-1, 1,-1,-1,-1/
      DATA (NHEL(I,   4),I=1,5) /-1, 1,-1, 0, 1/
      DATA (NHEL(I,   5),I=1,5) /-1, 1,-1, 0, 0/
      DATA (NHEL(I,   6),I=1,5) /-1, 1,-1, 0,-1/
      DATA (NHEL(I,   7),I=1,5) /-1, 1,-1, 1, 1/
      DATA (NHEL(I,   8),I=1,5) /-1, 1,-1, 1, 0/
      DATA (NHEL(I,   9),I=1,5) /-1, 1,-1, 1,-1/
      DATA (NHEL(I,  10),I=1,5) /-1, 1, 1,-1, 1/
      DATA (NHEL(I,  11),I=1,5) /-1, 1, 1,-1, 0/
      DATA (NHEL(I,  12),I=1,5) /-1, 1, 1,-1,-1/
      DATA (NHEL(I,  13),I=1,5) /-1, 1, 1, 0, 1/
      DATA (NHEL(I,  14),I=1,5) /-1, 1, 1, 0, 0/
      DATA (NHEL(I,  15),I=1,5) /-1, 1, 1, 0,-1/
      DATA (NHEL(I,  16),I=1,5) /-1, 1, 1, 1, 1/
      DATA (NHEL(I,  17),I=1,5) /-1, 1, 1, 1, 0/
      DATA (NHEL(I,  18),I=1,5) /-1, 1, 1, 1,-1/
      DATA (NHEL(I,  19),I=1,5) /-1,-1,-1,-1, 1/
      DATA (NHEL(I,  20),I=1,5) /-1,-1,-1,-1, 0/
      DATA (NHEL(I,  21),I=1,5) /-1,-1,-1,-1,-1/
      DATA (NHEL(I,  22),I=1,5) /-1,-1,-1, 0, 1/
      DATA (NHEL(I,  23),I=1,5) /-1,-1,-1, 0, 0/
      DATA (NHEL(I,  24),I=1,5) /-1,-1,-1, 0,-1/
      DATA (NHEL(I,  25),I=1,5) /-1,-1,-1, 1, 1/
      DATA (NHEL(I,  26),I=1,5) /-1,-1,-1, 1, 0/
      DATA (NHEL(I,  27),I=1,5) /-1,-1,-1, 1,-1/
      DATA (NHEL(I,  28),I=1,5) /-1,-1, 1,-1, 1/
      DATA (NHEL(I,  29),I=1,5) /-1,-1, 1,-1, 0/
      DATA (NHEL(I,  30),I=1,5) /-1,-1, 1,-1,-1/
      DATA (NHEL(I,  31),I=1,5) /-1,-1, 1, 0, 1/
      DATA (NHEL(I,  32),I=1,5) /-1,-1, 1, 0, 0/
      DATA (NHEL(I,  33),I=1,5) /-1,-1, 1, 0,-1/
      DATA (NHEL(I,  34),I=1,5) /-1,-1, 1, 1, 1/
      DATA (NHEL(I,  35),I=1,5) /-1,-1, 1, 1, 0/
      DATA (NHEL(I,  36),I=1,5) /-1,-1, 1, 1,-1/
      DATA (NHEL(I,  37),I=1,5) / 1, 1,-1,-1, 1/
      DATA (NHEL(I,  38),I=1,5) / 1, 1,-1,-1, 0/
      DATA (NHEL(I,  39),I=1,5) / 1, 1,-1,-1,-1/
      DATA (NHEL(I,  40),I=1,5) / 1, 1,-1, 0, 1/
      DATA (NHEL(I,  41),I=1,5) / 1, 1,-1, 0, 0/
      DATA (NHEL(I,  42),I=1,5) / 1, 1,-1, 0,-1/
      DATA (NHEL(I,  43),I=1,5) / 1, 1,-1, 1, 1/
      DATA (NHEL(I,  44),I=1,5) / 1, 1,-1, 1, 0/
      DATA (NHEL(I,  45),I=1,5) / 1, 1,-1, 1,-1/
      DATA (NHEL(I,  46),I=1,5) / 1, 1, 1,-1, 1/
      DATA (NHEL(I,  47),I=1,5) / 1, 1, 1,-1, 0/
      DATA (NHEL(I,  48),I=1,5) / 1, 1, 1,-1,-1/
      DATA (NHEL(I,  49),I=1,5) / 1, 1, 1, 0, 1/
      DATA (NHEL(I,  50),I=1,5) / 1, 1, 1, 0, 0/
      DATA (NHEL(I,  51),I=1,5) / 1, 1, 1, 0,-1/
      DATA (NHEL(I,  52),I=1,5) / 1, 1, 1, 1, 1/
      DATA (NHEL(I,  53),I=1,5) / 1, 1, 1, 1, 0/
      DATA (NHEL(I,  54),I=1,5) / 1, 1, 1, 1,-1/
      DATA (NHEL(I,  55),I=1,5) / 1,-1,-1,-1, 1/
      DATA (NHEL(I,  56),I=1,5) / 1,-1,-1,-1, 0/
      DATA (NHEL(I,  57),I=1,5) / 1,-1,-1,-1,-1/
      DATA (NHEL(I,  58),I=1,5) / 1,-1,-1, 0, 1/
      DATA (NHEL(I,  59),I=1,5) / 1,-1,-1, 0, 0/
      DATA (NHEL(I,  60),I=1,5) / 1,-1,-1, 0,-1/
      DATA (NHEL(I,  61),I=1,5) / 1,-1,-1, 1, 1/
      DATA (NHEL(I,  62),I=1,5) / 1,-1,-1, 1, 0/
      DATA (NHEL(I,  63),I=1,5) / 1,-1,-1, 1,-1/
      DATA (NHEL(I,  64),I=1,5) / 1,-1, 1,-1, 1/
      DATA (NHEL(I,  65),I=1,5) / 1,-1, 1,-1, 0/
      DATA (NHEL(I,  66),I=1,5) / 1,-1, 1,-1,-1/
      DATA (NHEL(I,  67),I=1,5) / 1,-1, 1, 0, 1/
      DATA (NHEL(I,  68),I=1,5) / 1,-1, 1, 0, 0/
      DATA (NHEL(I,  69),I=1,5) / 1,-1, 1, 0,-1/
      DATA (NHEL(I,  70),I=1,5) / 1,-1, 1, 1, 1/
      DATA (NHEL(I,  71),I=1,5) / 1,-1, 1, 1, 0/
      DATA (NHEL(I,  72),I=1,5) / 1,-1, 1, 1,-1/
      DATA IDEN/12/

      INTEGER POLARIZATIONS(0:NEXTERNAL,0:5)
      COMMON/BORN_BEAM_POL_au/POLARIZATIONS
      DATA ((POLARIZATIONS(I,J),I=0,NEXTERNAL),J=0,5)/NPOLENTRIES*-1/

C     
C     FUNCTIONS
C     
      LOGICAL IS_BORN_HEL_SELECTED

C     ----------
C     Check if helreset mode is on
C     ---------
      IF (HELRESET_AU) THEN
        NTRY = 0
        DO I=1,NCOMB
          GOODHEL(I) = .FALSE.
        ENDDO
        HELRESET_AU = .FALSE.
      ENDIF

C     ----------
C     BEGIN CODE
C     ----------
      IF(USERHEL.EQ.-1) NTRY=NTRY+1
      DO IHEL=1,NEXTERNAL
        JC(IHEL) = +1
      ENDDO
C     When spin-2 particles are involved, the Helicity filtering is
C      dangerous for the 2->1 topology.
C     This is because depending on the MC setup the initial PS points
C      have back-to-back initial states
C     for which some of the spin-2 helicity configurations are zero.
C      But they are no longer zero
C     if the point is boosted on the z-axis. Remember that HELAS
C      helicity amplitudes are no longer
C     lorentz invariant with expternal spin-2 particles (only the
C      helicity sum is).
C     For this reason, we simply remove the filterin when there is
C      only three external particles.
      IF (NEXTERNAL.LE.3) THEN
        DO IHEL=1,NCOMB
          GOODHEL(IHEL)=.TRUE.
        ENDDO
      ENDIF
      ANS = 0D0
      DO IHEL=1,NCOMB
        IF (USERHEL.EQ.-1.OR.USERHEL.EQ.IHEL) THEN
          IF (GOODHEL(IHEL) .OR. NTRY .LT. 20.OR.USERHEL.NE.-1) THEN
            IF(NTRY.GE.2.AND.POLARIZATIONS(0,0).NE.
     $       -1.AND.(.NOT.IS_BORN_HEL_SELECTED(IHEL))) THEN
              CYCLE
            ENDIF
            T=MATRIX_AU(P ,NHEL(1,IHEL),JC(1))
            IF(POLARIZATIONS(0,0).EQ.-1.OR.IS_BORN_HEL_SELECTED(IHEL))
     $        THEN
              ANS=ANS+T
            ENDIF
            IF (T .NE. 0D0 .AND. .NOT.    GOODHEL(IHEL)) THEN
              GOODHEL(IHEL)=.TRUE.
            ENDIF
          ENDIF
        ENDIF
      ENDDO
      ANS=ANS/DBLE(IDEN)
      IF(USERHEL.NE.-1) THEN
        ANS=ANS*HELAVGFACTOR
      ELSE
        DO J=1,NINITIAL
          IF (POLARIZATIONS(J,0).NE.-1) THEN
            ANS=ANS*BEAMS_HELAVGFACTOR(J)
            ANS=ANS/POLARIZATIONS(J,0)
          ENDIF
        ENDDO
      ENDIF
      END


      REAL*8 FUNCTION MATRIX_AU(P,NHEL,IC)
C     
C     Generated by MadGraph5_aMC@NLO v. 3.1.1, 2021-05-28
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     Returns amplitude squared -- no average over initial
C      state/symmetry factor
C     for the point with external lines W(0:6,NEXTERNAL)
C     
C     Process: a u > u w+ w- QCD=0 @1
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NGRAPHS
      PARAMETER (NGRAPHS=15)
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=5)
      INTEGER    NWAVEFUNCS, NCOLOR
      PARAMETER (NWAVEFUNCS=10, NCOLOR=1)
      REAL*8     ZERO
      PARAMETER (ZERO=0D0)
      COMPLEX*16 IMAG1
      PARAMETER (IMAG1=(0D0,1D0))
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL)
      INTEGER NHEL(NEXTERNAL), IC(NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER I,J
      COMPLEX*16 ZTEMP
      REAL*8 CF(NCOLOR,NCOLOR)
      COMPLEX*16 AMP(NGRAPHS), JAMP(NCOLOR)
      COMPLEX*16 W(20,NWAVEFUNCS)
      COMPLEX*16 DUM0,DUM1
      DATA DUM0, DUM1/(0D0, 0D0), (1D0, 0D0)/
      logical match
C     
C     GLOBAL VARIABLES
C     
      INCLUDE 'coupl.inc'
      include 'wwpars.f'
      include 'egam0.f'
      include 'pol.f'

      mdl_ww=0d0
      mdl_wz=0d0

      if(scpol)then
         if(nhel(1).eq.1)then
            matrix_au=0d0
            return
         endif
      endif

      call wwpol_match(pol,nhel(4),nhel(5),match)
      if(match.eqv..false.)then
         matrix_au=0d0
         return
      endif
      
C     
C     COLOR DATA
C     
      DATA (CF(I,  1),I=  1,  1) /3.000000000000000D+00/
C     1 T(3,2)
C     ----------
C     BEGIN CODE
C     ----------
      
      CALL VXXXXX(P(0,1),ZERO,NHEL(1),-1*IC(1),W(1,1))
      CALL IXXXXX(P(0,2),ZERO,NHEL(2),+1*IC(2),W(1,2))
      CALL OXXXXX(P(0,3),ZERO,NHEL(3),+1*IC(3),W(1,3))
      CALL VXXXXX(P(0,4),MDL_MW,NHEL(4),+1*IC(4),W(1,4))
      CALL VXXXXX(P(0,5),MDL_MW,NHEL(5),+1*IC(5),W(1,5))      
      CALL FFV1_2(W(1,2),W(1,1),GC_2,ZERO,ZERO,W(1,6))
      CALL FFV2_1(W(1,3),W(1,5),GC_100,ZERO,ZERO,W(1,7))
C     Amplitude(s) for diagram number 1
      CALL FFV2_0(W(1,6),W(1,7),W(1,4),GC_100,AMP(1))
      CALL VVV1P0_1(W(1,5),W(1,4),-GC_3,ZERO,ZERO,W(1,8))
C     Amplitude(s) for diagram number 2
      CALL FFV1_0(W(1,6),W(1,3),W(1,8),GC_2,AMP(2))
      CALL VVV1_3(W(1,5),W(1,4),GC_53,MDL_MZ,MDL_WZ,W(1,9))
C     Amplitude(s) for diagram number 3
      CALL FFV2_5_0(W(1,6),W(1,3),W(1,9),-GC_50,GC_58,AMP(3))
      CALL FFV1_1(W(1,3),W(1,1),GC_2,ZERO,ZERO,W(1,6))
      CALL FFV2_2(W(1,2),W(1,4),GC_100,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 4
      CALL FFV2_0(W(1,10),W(1,6),W(1,5),GC_100,AMP(4))
C     Amplitude(s) for diagram number 5
      CALL FFV1_0(W(1,2),W(1,6),W(1,8),GC_2,AMP(5))
C     Amplitude(s) for diagram number 6
      CALL FFV2_5_0(W(1,2),W(1,6),W(1,9),-GC_50,GC_58,AMP(6))
      CALL VVV1_2(W(1,1),W(1,4),-GC_3,MDL_MW,MDL_WW,W(1,6))
      CALL FFV1P0_3(W(1,2),W(1,3),GC_2,ZERO,ZERO,W(1,9))
C     Amplitude(s) for diagram number 7
      CALL VVV1_0(W(1,9),W(1,5),W(1,6),-GC_3,AMP(7))
      CALL FFV2_5_3(W(1,2),W(1,3),-GC_50,GC_58,MDL_MZ,MDL_WZ,W(1,8))
C     Amplitude(s) for diagram number 8
      CALL VVV1_0(W(1,5),W(1,6),W(1,8),GC_53,AMP(8))
C     Amplitude(s) for diagram number 9
      CALL FFV2_0(W(1,2),W(1,7),W(1,6),GC_100,AMP(9))
      CALL VVV1_3(W(1,1),W(1,5),-GC_3,MDL_MW,MDL_WW,W(1,6))
C     Amplitude(s) for diagram number 10
      CALL VVV1_0(W(1,9),W(1,6),W(1,4),-GC_3,AMP(10))
C     Amplitude(s) for diagram number 11
      CALL VVV1_0(W(1,6),W(1,4),W(1,8),GC_53,AMP(11))
C     Amplitude(s) for diagram number 12
      CALL FFV2_0(W(1,10),W(1,3),W(1,6),GC_100,AMP(12))
C     Amplitude(s) for diagram number 13
      CALL FFV1_0(W(1,10),W(1,7),W(1,1),GC_1,AMP(13))
      CALL VVVV2P0_1(W(1,1),W(1,5),W(1,4),GC_5,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 14
      CALL FFV1_0(W(1,2),W(1,3),W(1,10),GC_2,AMP(14))
      CALL VVVV5_4(W(1,1),W(1,5),W(1,4),GC_57,MDL_MZ,MDL_WZ,W(1,10))
C     Amplitude(s) for diagram number 15
      CALL FFV2_5_0(W(1,2),W(1,3),W(1,10),-GC_50,GC_58,AMP(15))
      JAMP(1)=+AMP(1)+AMP(2)+AMP(3)+AMP(4)+AMP(5)+AMP(6)+AMP(7)+AMP(8)
     $ +AMP(9)+AMP(10)+AMP(11)+AMP(12)+AMP(13)+AMP(14)+AMP(15)

      
      if(sfonly)then
         JAMP(1)=AMP(7)+AMP(10)+AMP(14)
      else
         JAMP(1)=AMP(7)+AMP(10)+AMP(14)+AMP(8)+AMP(11)+AMP(15)
      endif

      if(addnsf)then
        JAMP(1)=+AMP(1)+AMP(2)+AMP(3)+AMP(4)+AMP(5)+AMP(6)+AMP(7)+AMP(8)
     $        +AMP(9)+AMP(10)+AMP(11)+AMP(12)+AMP(13)+AMP(14)+AMP(15)
      endif

c      JAMP(1)=AMP(14)

c      JAMP(1)=0d0
c      JAMP(1)=JAMP(1)+AMP(2)+AMP(5)+AMP(3)+AMP(6)
      
      
      MATRIX_AU = 0.D0
      DO I = 1, NCOLOR
        ZTEMP = (0.D0,0.D0)
        DO J = 1, NCOLOR
          ZTEMP = ZTEMP + CF(J,I)*JAMP(J)
        ENDDO
        MATRIX_AU = MATRIX_AU+ZTEMP*DCONJG(JAMP(I))
      ENDDO

      
      if(wpol.eq.'tot')then
      elseif(wpol.eq.'tran')then
         if(nhel(5).eq.0)matrix_au=0d0
         if(nhel(4).eq.0)matrix_au=0d0
      elseif(wpol.eq.'long')then
         if(nhel(5).eq.1)matrix_au=0d0
         if(nhel(4).eq.1)matrix_au=0d0
         if(nhel(5).eq.-1)matrix_au=0d0
         if(nhel(4).eq.-1)matrix_au=0d0
      endif

c$$$      if(nhel(5).eq.0)matrix_au=0d0
c$$$      if(nhel(4).eq.0)matrix_au=0d0
c$$$      if(nhel(5).eq.-1)matrix_au=0d0
c$$$      if(nhel(4).eq.-1)matrix_au=0d0

c      if(nhel(1).eq.-1)matrix_au=0d0

      
      END

  
