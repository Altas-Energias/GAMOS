#include NIST_materials.txt
#include NIST_elements.txt


:P source_detector_distance 70.0*cm

:P x_mundo 1800.0/2.0
:P y_mundo 1800.0/2.0
:P z_mundo 1800.0/2.0
:P x_detector 14.0/2.0
:P y_detector 14.0/2.0 
:P z_detector 1.0/2.0 



:MIXT Al2O3 3.961000 2
   Aluminum 0.529250
   Oxygen   0.470750

:MIXT Hidroxiapatita 3.160000 4
   Calcium 0.398940
   Phosphorus 0.184990
   Oxygen 0.414060
   Hydrogen 0.002010

:MIXT CaC2O4 0.002200 3
   Calcium 0.312880
   Carbon  0.187530
   Oxygen  0.499590




:ROTM R00 0.0 0.0 0.0

:VOLU world BOX $x_mundo $y_mundo $z_mundo G4_AIR

// Creamos un tubo de radio interno cero (relleno), radio externo de 1 mm, longitud de 5 mm y hecho de aire. Simbolizara la fuente de rayos X 
// :VOLU nombre TUBE radio_interno radio_externo mitad_de_la_longitud material 
:VOLU source TUBE 0.0*mm 1.0*mm 2.5*mm G4_AIR
// :PLACE nombre numero_de_copias_del_volumen dentro_de_donde_esta matriz_de_rotacion pos_x pos_y pos_z
:PLACE source 1 world R00 0.0 0.0 0.0

// Creamos un cubo de lado 4 cm y hecho de PMMA, situado a 65.63 cm del origen (de la fuente)
// :VOLU nombre BOX mitad_de_la_longitud_en_x mitad_de_la_longitud_en_y mitad_de_la_longitud_en_z material
:VOLU cubo BOX 2.0*cm 2.0*cm 2.0*cm NIST_PMMA
:PLACE cubo 1 world R00 0.0 0.0 65.63*cm 
:COLOUR cubo 198 251 145

// Creamos un tubo de PMMA de radio externo 1.4 cm, hecho de PMMA y que estara adentro del cubo
:VOLU cilindro TUBE 0.0*cm 1.4*cm (10.0/2.0)*mm NIST_PMMA
:PLACE cilindro 1 cubo R00 0.0*cm 0.0*cm 0.5*cm
:COLOUR cilindro 0.9960 0.7294 0.6666

// Creamos una esfera de acero de diametro 1.5875 mm
// :VOLU nombre ORB radio material
:VOLU bola_de_acero ORB (1.5875/2.0)*mm G4_STAINLESS-STEEL
:PLACE bola_de_acero 1 cilindro R00 0.0*mm 0.0*mm 0.0*mm
:COLOUR bola_de_acero 0.0 0.0 0.7

// Creamos el detector, aparte de lo hecho en paralela.geom 
:VOLU detector BOX $x_detector $y_detector $z_detector G4_CADMIUM_TELLURIDE
:PLACE detector 1 world R00 0.0 0.0 $source_detector_distance
:COLOUR detector 0.6 0.6 0.6

