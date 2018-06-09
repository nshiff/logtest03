# logtest03

This is a small experiment with stretching flags to see what they would look like. Please consider the software in alpha status - it will require configuration to work.

If you're not familiar with Processing, or even with programming at all, take a look over at https://processing.org/ for great tutorials and examples. 

The central algorithm is rather naive. Just loop over the 2D array of pixels in the image, and output the pixel again. However, output the pixel in a scaled position: either logarithmically or exponentially (backwards logarithmic). Currently the program doesn't handle large images in a special way, so to see the full output, I recommend images under 600x400 or so. 
