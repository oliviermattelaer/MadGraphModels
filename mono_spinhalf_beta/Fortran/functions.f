c Momenta of particles in event, written by the user

      DOUBLE PRECISION FUNCTION mymdl_FormFactor(AAA)
      IMPLICIT NONE
      
      INCLUDE '/home/arka/LatestMadGraph5/MG5_aMC_v2_5_4/Pre6/Source/genps.inc'
      DOUBLE PRECISION pp(0:3,max_particles)
      COMMON/momenta_pp/pp
      INCLUDE 'input.inc' ! include all model parameter
      
      DOUBLE PRECISION AAA
      
      DOUBLE PRECISION SHAT
      
      SHAT = pp(1,3)*pp(1,3)+pp(2,3)*pp(2,3)+pp(3,3)*pp(3,3)
      
      mymdl_FormFactor = SQRT(1 - AAA*AAA/(SHAT + AAA*AAA)) !SQRT(1 - AAA**2/(10+AAA**2)) ! beta = sqrt(1 - mass^2/energy^2)
      END