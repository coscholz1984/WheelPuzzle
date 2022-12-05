# WheelPuzzle

This is an Octave script that can be used to mathematically investigate the symmetry of the ring puzzle from Paper Mario - The Origami King by Intelligent Systems, published by Nintendo. A very nice web-based app by Alyssa Haroldsen can be found at https://papermario.alyssa.codes.

<img src="https://github.com/coscholz1984/WheelPuzzle/blob/main/Wheel1.JPG" alt="Board with ring selected" width="250"/><img src="https://github.com/coscholz1984/WheelPuzzle/blob/main/Wheel2.JPG" alt="Board with segments selected" width="250"/><img src="https://github.com/coscholz1984/WheelPuzzle/blob/main/Wheel3.JPG" alt="Board with 200 segments" width="250"/>

Controls are 'w,a,s,d' to move and space to toggle ring/segment mode. In my code the number of rings and segments can be freely varied (however, number of segments must be even, so that every segment has its opposite). This puzzle has some interesting mathematic properties, for instance it features periodic boundaries along the angular coordinate and mirrored modulo periodic boundaries along the radial coordinate. It therefore topologically lives on a sphere, but pieces have to be mirrored along the poles if they move across.

A way to visualize this is to draw the pieces on a diamond-like shape.

<img src="https://github.com/coscholz1984/WheelPuzzle/blob/main/Diamond1.jpg" alt="Puzzle on a diamond - side" height="300"/><img src="https://github.com/coscholz1984/WheelPuzzle/blob/main/Diamond2.jpg" alt="Puzzle on a diamond - top" height="300"/>

My code is public domain. There is no warranty.
