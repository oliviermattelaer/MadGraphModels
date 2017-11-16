c Momenta of particles in event, written by the user

      REAL*8 FUNCTION mymdl_FormFactor(AAA)
      IMPLICIT NONE
      INCLUDE '/home/arka/LatestMadGraph5/MG5_aMC_v2_5_4/Pre6/Source/genps.inc'
      COMMON/momenta_pp/pp
      INCLUDE 'input.inc' ! include all model parameter
      REAL*8 pp(0:3,max_particles)
      REAL*8 AAA
      REAL*8 PSQUARE, OUT

      PSQUARE = pp(1,2)*pp(1,2)+pp(2,2)*pp(2,2)+pp(3,2)*pp(3,2)
      
      !mymdl_FormFactor = SQRT(SHAT)/(AAA-AAA+pp(0,2))
      mymdl_FormFactor = SQRT(1.0 - AAA*AAA/(PSQUARE+AAA*AAA))  ! beta = sqrt(1 - mass^2/energy^2)
      OUT = SQRT(1.0 - AAA*AAA/(PSQUARE+AAA*AAA))
      !PRINT *, 'Form Factor:', OUT
      
      RETURN
      END