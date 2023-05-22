<<<<<<< HEAD
=======

>>>>>>> f6cfe8432ada8dcfe79ac7924148b33377e37faa
MCP2EventHist
=============

This repository hosts the application, `Sophiread_HFIR`, which can be used to process raw data from timepix3 chips and perform clustering and peak fitting to extract neutron events. 

This program is based on `Sophiread`. (Copied 05212023)

Changes from Sophiread

- TOF,TOA data are not saved in .h5 file.
- abs_max_cluster_size for abs calculation is added. This can be set in `user_defined_params.txt`
