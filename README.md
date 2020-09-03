# docker-matlab
Matlab/Simulink on Docker via Web Browser

This creates a docker image that can serve Matlab over rdp to a user's browser.

# How to run:
1. Download Matlab install files and copy them to "root/matlab_install/".
2. Insert any extra files that you need in the "root" folder following the correct path. (It will overwrite any existing file with the same name.)
3. Modify the "installer_input.txt.template" file with your license code and which software you want to install and then rename it to installer_input.txt overwriting the old one.
  - NOTE: If all components are commented out, then it will install everything your license works for.
4. Add your "license.lic" file to "root/usr/local/MATLAB/<matlab_version>/licenses/".
5. Build the image. This takes a long time because Matlab can be a BIG install. Base Matlab is a ~5GB image and adding Simulink and a couple toolboxes brought mine up to ~11GB
