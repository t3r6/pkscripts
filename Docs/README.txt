Console utilities to convert the mpk format to and from Ascii Scene (ASE): ase2mpk, mpk2ase, blend, and PKBlend with GUI.

The package also contains console utilities to convert the dat format to and from Ascii Scene (ASE): dat2ase and mpk2dat.

mpk2ase, dat2ase, mpk2dat, blend, PKBlend, and 3dsmax9 PK-optimized asciiexp plugin were created by dilettante.

Info:
ase2mpk converts 3ds max ASE files to Pain Engine mpk format
version 1.2

usage: ase2mpk [OPTION] FILE

   -o             optimize mesh data (recommended)
   -l <string>    lightmap name suffix


mpk2ase converts Pain Engine mpk file to ASE format
Usage: mpk2ase <filename>


blend assigns one common light map to several mesh objects
blend.exe dm_temp.mpk


dat2ase converts Pain Engine item file to ASE format
Usage: dat2ase <filename>


mpk2dat converts Pain Engine mpk file to DAT format
Usage: mpk2dat <filename>



3dsmax9 plugins in the archive: asciiimp and asciiexp. The latter is a slightly modified version of the standard plugin optimized for Painkiller, so you need to make a backup copy before replacing it.

The ase2mpk converter from PCF does not allow you to create a map that is complete in all respects. Its advantages - independence from the Autodesk 3ds Max version and the optimization algorithm are negated by significant disadvantages, such as:
1. Inability to assign one common light map to several mesh objects (standard scheme for all original maps without exception).
2. Inability to work with blend material.
3. Distortion of dynamic lighting calculations as a result of inversion of the Y-normal and the dependence of the orientation of the normals on the transformation of the geometry during the modeling process.

The first point and only partially the second point can be solved using the console tool blend.exe. To solve the problem with normals, a mandatory "Reset XForm" with pre-inversion of the Y-normal is required or you can use a modified ASCII export plugin (3dsmax9 PK-optimized). All this creates unnecessary difficulties and inconveniences.

As for importing mpk into Autodesk 3ds Max (not provided by the original developer, People Can Fly), mpk2ase is also not a full-fledged tool - the original normals are lost and the correct structure of materials is disrupted if several combinations of texture mixing are used within one mesh object. In addition, importing an ASE file requires a plugin that is not included in the standard 3dsmax package.

To create a DAT file:
Draw the geometry in 3ds Max, export it to ASE format (by checking the InvYN box), convert the resulting ASE to mpk and finally, mpk to dat. I would like to draw your attention to the fact that the DAT format, like MPK, supports two texture channels (light maps).

To import geometry from a DAT file:
Convert DAT to ASE (dat2ase does the same as mpk2ase) and then import the resulting ASE into 3dsmax.

