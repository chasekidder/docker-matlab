# docker-matlab
Matlab/Simulink on Docker via Web Browser

This creates a docker image that can serve Matlab over rdp to a user's browser.

# How to run:
1. Download Matlab install files and copy them to a "matlab" folder in the build context.
2. Insert any extra files that you need in the "root" folder following the correct path. (It will overwrite any existing file with the same name.)
3. Rename "installer_input.txt.template" to "installer_input.txt" in your build context.
3. Modify the "installer_input.txt" file with your license code and which software you want to install.
  - NOTE: If they are all commented out, then it will install everything your license works for.
4. Copy the new "installer_input.txt" file into the folder that contains your Matlab install files. This should overwrite the one that is already there.
5. Add your "license.lic" file to the root folder under the correct subfolder for your Matlab install location.
6. Build the image. This takes a long time because Matlab can be a BIG install. Base Matlab is a ~5GB image and adding Simulink and a couple toolboxes brought mine up to ~11GB
