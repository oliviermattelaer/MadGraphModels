
1. The working spin ½ model name is wendy_beta and it is kept here:
 https://github.com/asantra/MadGraphModels/tree/master/wendy_beta

Different parts of the model:
a. Monopoles are defined in particles.dat:
https://github.com/asantra/MadGraphModels/blob/master/wendy_beta/particles.dat#L43

b. Photon-monopole vertex is defined in interactions.dat:
https://github.com/asantra/MadGraphModels/blob/master/wendy_beta/interactions.dat#L115

c. To apply the velocity dependence, I use this setscales.f:
https://github.com/asantra/MadGraphModels/blob/master/FortranModelSetScale/setscales.f

d. In the setscales.f, the velocity is defined here as a function of monopole mass and the center of mass energy:
https://github.com/asantra/MadGraphModels/blob/master/FortranModelSetScale/setscales.f#L141

The couplings get modified in these lines in setscales.f:
https://github.com/asantra/MadGraphModels/blob/master/FortranModelSetScale/setscales.f#L148
https://github.com/asantra/MadGraphModels/blob/master/FortranModelSetScale/setscales.f#L149

3. With these modifications, a good beta dependent photon monopole coupling model for spin ½ monopole is obtained. Here one can see a transverse momentum distribution:
https://github.com/asantra/MadGraphModels/blob/master/ComparisonPlots_PhotonFusion_BetaNonBeta_v93_M1000Pt.png

As coupling is now beta dependent, the monopoles with higher velocities are produced with more probability, and hence there is a right shift in the transverse momentum distribution.

*******************************************

4. Now I want to do the same with the python UFO model. The model name is mono_spinhalf_beta and it is kept here:
https://github.com/asantra/MadGraphModels/tree/master/mono_spinhalf_beta

I will walk through different parts of the model:

a. monopoles are defined in particles.py file:
https://github.com/asantra/MadGraphModels/blob/master/mono_spinhalf_beta/particles.py#L386

b. The coupling constant (GCH) is defined in parameters.py:
https://github.com/asantra/MadGraphModels/blob/master/mono_spinhalf_beta/parameters.py#L236

c. The centre of mass energy (COM) is defined in parameters.py:
https://github.com/asantra/MadGraphModels/blob/master/mono_spinhalf_beta/parameters.py#L244

d. The vertices are defined in vertices.py:
https://github.com/asantra/MadGraphModels/blob/master/mono_spinhalf_beta/vertices.py#L930

e. The lorentz structure (with velocity = sqrt(1 – 4*mass^2/s) where s is square of COM (EDIT: THIS IS A MISTAKE, s IS mANDELSTAM VARIABLE, NOT COM. HENCE s IS NOT CONSTANT ALWAYS)) is defined in lorentz.py:
https://github.com/asantra/MadGraphModels/blob/master/mono_spinhalf_beta/lorentz.py#L54

f. The coupling order is defined in couplings.py:
https://github.com/asantra/MadGraphModels/blob/master/mono_spinhalf_beta/couplings.py#L444

5. This is again the transverse momentum distribution of the monopoles:
https://github.com/asantra/MadGraphModels/blob/master/ComparisonPlots_PhotonFusion_BetaNonBeta_v95_M1000Pt.png

Here velocity (beta) dependent and independent model give same distribution. So beta dependence was not applied properly.

6. I wanted to modify the setscales.f as before (like I did with the Fortran model wendy_beta). This is the modified setscales.f:

https://github.com/asantra/MadGraphModels/blob/master/PythonModelSetScale/setscales.f

A quick walk through of the setscales.f:
–-----------


a. defined the coupling:
https://github.com/asantra/MadGraphModels/blob/master/PythonModelSetScale/setscales.f#L72

b. the velocity of the particle:
https://github.com/asantra/MadGraphModels/blob/master/PythonModelSetScale/setscales.f#L77

c. velocity dependent coupling:
https://github.com/asantra/MadGraphModels/blob/master/PythonModelSetScale/setscales.f#L78
(one additional question: is it possible to take the value of mass from param_card.dat? )

d. Then the scale is set here:
https://github.com/asantra/MadGraphModels/blob/master/PythonModelSetScale/setscales.f#L122

7. But when I ran the python UFO model with this new setscales.f, I got the error:
https://github.com/asantra/MadGraphModels/blob/master/ErrorMessage.txt

It seems GCH(1) is not declared for python UFO model, though GAM(1) was declared for the Fortran model.

*********************
