
:P x_container 14.0/2.0
:P y_container 14.0/2.0
:P z_container 1.0/2.0
:P pixel 0.0546875
:P pixel_medios (0.0546875)/2.0
:P grosor_pixel_z_medios 1.0/2.0
:P grosor_pixel_z 1.0

:VOLU mesh_container BOX $x_container $y_container $z_container G4_AIR
:PLACE mesh_container 1 world R00 0.0 0.0 $source_detector_distance
:VOLU mesh BOX $pixel_medios $pixel_medios $grosor_pixel_z_medios G4_CADMIUM_TELLURIDE
:PLACE_PARAM mesh 1 mesh_container PHANTOM 256 256 1 $pixel $pixel $grosor_pixel_z

