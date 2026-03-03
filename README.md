# dotfiles-hypr
dotfiles for my hyprland setup

# Specifications

Operating System:
Arch Linux

Login Session:
* Display Server - X11
* Display Manager - SDDM
* SDDM Theme - Silent SDDM

User Session:
* Display Server - Wayland
* Wayland Compositor - Hyprland
* Desktop Shell - Dank Material Shell (DMS)
* Terminal - ghostty
* Shell - zsh

# Notes

Temporary place for notes related to setting up udev rules, etc.

## Hybrid Nvidia Laptops
Useful Arch Linux Commands.
You can use all the commands below to get you GPUs' PCI addresses.
These PCI addresses can then be used to determine which gpu is used 
to display and which gpu is used to render. You can also setup 
systemd udev rules to force your display-manager (e.g. SDDM) to wait 
for your DRM display device to be ready. These commands are mainly 
useful for hybrid Nvidia (nvidia + intel) gpus.

Lists all gpus on your system and the kernel modules they use:
```bash
sudo lspci -k | grep -A 3 -i "VGA\|3D"
```

Lists all drm devices:
```bash
sudo ls -la /dev/dri/
```

List drm device information:
```bash
sudo udevadm info /sys/class/drm/card*
```
Be sure to replace the `*` above with the actual drm card number.

Check if drm device is display device:
```bash
cat /sys/class/drm/card*/device/boot_vga
```
The above is an easier way to check if the drm is the display 
device. Remember to replace the `*` in `card*` with the actual 
drm card number.



The commands below are used to test your udev rules.

Enable udev subsystem logging:
```bash
sudo udevadm monitor --subsystem-match=drm --environment
```
You may want to pipe the results into a log file
For example (... > udev.log) because udevadm monitor is a 
running process and the udevadm trigger command that adds 
the drm tag will force you out of your user session. You 
may lose your logs.

Tag your drm devices with your udev rule:
```bash
sudo udevadm trigger --subsystem-match=drm --action=add
```
The above command tags your drm devices so systemd can 
recogize and track your drm devices. This allows systemd 
to track your drm device of interest throughout the boot 
process and tell your display-manager to wait until your 
drm device of interest is ready to take requests.


Add comments per commands later...
```bash
sudo systemctl daemon-reload
sudo systemctl cat display-manager.service
```

```bash
sudo journalctl -u sddm
sudo journalctl -b
```

