# Mountain Path Tracer

The idea for this project was obtained from this [website](http://nifty.stanford.edu/2016/franke-mountain-paths/). 

This Processing program will read in a file containing height data for a terrain
and find a path from one side to the other.

The explorer uses a greedy algorithm; at each step it scans the neighboring
areas and moves to the one that will produce the smallest height differential.
