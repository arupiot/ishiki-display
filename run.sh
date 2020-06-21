# ishiki-display Dockerfile

# in order to run this, a bind mount to the /media/usb directory must be created
# so that the display program can access the logo and background images
# docker run -it --name ishiki-display -v /media/usb:/media/usb arupiot/ishiki-display:latest
# the container must also be run in privileged mode and the framebuffer and touchscreen devices must be bind-mounted

#docker run -it --rm --name ishiki-display -v /media/usb:/media/usb arupiot/ishiki-display:latest
docker run --privileged -it --rm --name ishiki-display --network host \
    -v /media/usb:/media/usb \
    -v /dev/fb0:/dev/fb0 \
    -v /dev/input/event0:/dev/input/event0 \
    -e HOSTNAME=$HOSTNAME \
    arupiot/ishiki-display:latest
