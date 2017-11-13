c Momenta of particles in event
      include '/home/arka/LatestMadGraph5/MG5_aMC_v2_5_4/Pre6/Source/genps.inc'
      double precision pp(0:3,max_particles)
      common/momenta_pp/pp

      double complex mymdl_FormFactor(M1)
      
      include 'input.inc' ! include all model parameter
      double complex M1
<<<<<<< HEAD
=======
      include 'input.inc' ! include all model parameter
>>>>>>> 4507bc111ff7f87413f4a96c3b60f2a6e927d7f4
      
      mymdl_FormFactor = SQRT(1 - M1**2/(pp(0,2)**2)) ! beta = sqrt(1 - mass^2/energy^2)
      return 
      end
