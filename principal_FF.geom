#include NIST_materials.txt
#include NIST_elements.txt

// Para la imagen de campo plano en este caso se toma el mismo fantoma creado en principal_raw.geom pero sin la bola de acero

:P source_detector_distance 70.0*cm


:P x_mundo 1800.0/2.0
:P y_mundo 1800.0/2.0
:P z_mundo 1800.0/2.0
:P x_fantoma 10.0/2.0
:P z_fantoma 1.0/2.0
:P x_detector 14.0/2.0
:P y_detector 14.0/2.0 
:P z_detector 1.0/2.0 

:ROTM R00 0.0 0.0 0.0

:VOLU world BOX $x_mundo $y_mundo $z_mundo G4_AIR

:MIXT Al2O3 3.961000 2
   Aluminum 0.529250
   Oxygen   0.470750

:VOLU source TUBE 0. 1. 2.5 G4_AIR
:PLACE source 1 world R00 0. 0. 0.

:VOLU cubo BOX 2.0*cm 2.0*cm 2.0*cm NIST_PMMA
:PLACE cubo 1 world R00 0.0 0.0 65.63*cm 
:COLOUR cubo 198 251 145

:VOLU detector BOX $x_detector $y_detector $z_detector G4_CADMIUM_TELLURIDE
:PLACE detector 1 world R00 0. 0. $source_detector_distance
:COLOUR detector 0.6 0.6 0.6

