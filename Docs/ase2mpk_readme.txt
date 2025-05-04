Copyright (c) 2003,2004 People Can Fly

ase2mpk
=======

Intro
-----

This command line tool converts 3ds max ASE files to Pain engine mpk format.
ASE is commonly used text file format 3ds max uses to export geometry data.

Basic syntax is (command line):

ase2mpk <Name_Of_ASE_File>

It will output mpk file with the same name, e.g. ase2mpk stuff.ase will output
stuff.mpk in the same directory.


Options
-------

ase2mpk accepts the following options:

-o  

	this option optimizes mesh data and should generally be turned on, unless
	you're exporting very often as it takes slightly more time. Definitely do
	not forget to use it for final version of your mesh/level data.

-l <suffix>

	this option lets you specify the lightmap suffix. This is needed for the engine
	to find lightmap textures. The lightmap texture is defined for every mesh object
	in the level and its name is derived from the name of the mesh. For example for
	the mesh named "object", the lightmap texture name will be "object" + suffix
	specified with this option, e.g. "object_lmap" when -l _lmap is used. The default
	suffix (i.e. one used when nothing is specified with -l option) is "_L_0000"
	(NOTE: it's four zeros).

Additional notes
----------------

The meshes in your ASE file must be triangulated.

The maximum number of supported UV channels is 2. If there are more UV channels you may
get an error or undefined results. The meshes can have 1 UV channel (dynamically lit, no
lightmaps associated) or 2 UV channels, where the 2nd UV channel is used for lightmaps,
and the lightmap is associated based on the name of the mesh object (see option -l above).
