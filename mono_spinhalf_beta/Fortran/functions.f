c Momenta of particles in event
      include '/home/arka/LatestMadGraph5/MG5_aMC_v2_5_4/Pre6/Source/genps.inc'
      double precision pp(0:3,max_particles)
      common/momenta_pp/pp

double complex mymdl_FormFactor(M1):

      double complex M1
      include '/home/arka/LatestMadGraph5/MG5_aMC_v2_5_4/Pre6/Source/input.inc' ! include all model parameter
      
      mymdl_FormFactor = SQRT(1 - M1**2/(pp(0,2)**2)) ! beta = sqrt(1 - mass^2/energy^2)
      return 
      end