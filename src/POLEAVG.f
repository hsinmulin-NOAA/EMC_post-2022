      SUBROUTINE POLEAVG(IM,JM,JSTA,JEND,SMALL,COSL,SPVAL,VAR)
! This program averages scalor fields at pole points
      implicit none

      INCLUDE 'mpif.h'
      INTEGER,intent(in) ::  IM,JM,JSTA,JEND
      REAL,intent(in) ::  SMALL,SPVAL
      REAL,intent(in) :: COSL(IM,JSTA:JEND)
      REAL,intent(inout) :: VAR(IM,JSTA:JEND)
      INTEGER I,JJ,ICOUNT
      REAL WORK
!
      JJ=1
      IF(JJ>=jsta .and. JJ<=jend .and. cosl(1,JJ)<SMALL)then
        WORK=0.
	ICOUNT=0
        DO I=1,IM
	  IF(VAR(I,JJ)/=SPVAL)THEN
            WORK=VAR(I,JJ)+WORK
	    ICOUNT=ICOUNT+1
	  END IF  
        END DO
        DO I=1,IM
          VAR(I,JJ)=WORK/ICOUNT
        END DO      
      END IF	
      JJ=JM
      IF(JJ>=jsta .and. JJ<=jend .and. cosl(1,JJ)<SMALL)then
        WORK=0.
	ICOUNT=0
        DO I=1,IM
	  IF(VAR(I,JJ)/=SPVAL)THEN
            WORK=VAR(I,JJ)+WORK
	    ICOUNT=ICOUNT+1
	  END IF
        END DO
        DO I=1,IM
          VAR(I,JJ)=WORK/ICOUNT
        END DO      
      END IF
      RETURN
      END