! *****************************************************************
! *             TMAIN:  Main Program for SOI Model                *
! *****************************************************************

!JAK 4JAN2016 - updates for gfortran: remove dflib, change logials from EQ to EQV, Binary file type to Unformatted
!  Verify ITEMIZE is logical.
!JAK 3FEB2016 - remove interactive prompts for files.
!development
!for demo

PROGRAM TAXMODEL


USE RANDOM_MOD

IMPLICIT NONE



! INITIALIZE RANDOM NUMBER GENERATOR
CALL INIT_RANDOM_NUMBER_GENERATOR

! DRAW RANDOM NUMBERS FOR USE IN LATER ROUTINES
CALL RANDOM





END PROGRAM TAXMODEL
