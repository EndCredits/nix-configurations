# Crepuscular's NixOS Install Configurations

## My Hardware
 - CPU: Intel(R) Xeon(R) CPU E5-2670 v2 @ 2.50GHz x2
 - MotherBoard Chipset: Intel X79
 - Memory: Samsang DDR3 16GB 1333Mhz x3
 - HDD0: Seagate ST2000DM008-2FR1 4.0TB
 - HDD1: Western Digital WDC WD10EZEX-00B 1.0TB
 - Network: Realtek RTL8106e Network Adaptor
 - Graphic: Nvidia Geforce GTX 1660Ti

---

## What included

Please check repository context

---

## How to use

Check your partition table frist

```
sudo fdisk -l
```

Then edit your partition table to create an installation environment

```
sudo cfdisk /dev/sdX
```

Formatting your partition

```
sudo mkfs.ext4 -L nixos /dev/sdXa

sudo mkfs.fat -L boot -F 32 /dev/sdXb  # Only necessary if you are using UEFI boot or you want to apart boot partition from system

sudo mkswap /dev/sdXc # Only necessary if you have a swap partition
```

Make sure you have mounted partitions to correct directory

```
sudo mount -rw /dev/disk/by-label/nixos /mnt

sudo mkdir -p /mnt/boot/ # Only necessary if you are using UEFI boot or you want to apart boot partition from system

sudo mount -rw /dev/disk/by-label/boot /mnt/boot # Only necessary if you are using UEFI boot or you want to apart boot partition from system

sudo swapon /dev/sdXc # Only necessary if you have a swap partition
```

Like this:

```
Disk /dev/sdb: 931.51 GiB, 1000204886016 bytes, 1953525168 sectors
Disk model: WDC WD10EZEX-00B
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 0610BF1E-F419-48D5-B78C-514E45AE1D2A

Device        Start        End    Sectors  Size Type
/dev/sdb1      2048    3147775    3145728  1.5G Linux filesystem
/dev/sdb2   3147776   45090815   41943040   20G Linux filesystem
/dev/sdb3  45090816 1953525134 1908434319  910G Linux filesystem
```

Clone configurations into installation directory

```
git clone https://github.com/EndCredits/nix-configurations -b main /mnt/etc/nixos/
```

Delete my hardware scan result

```
sudo rm -rf /mnt/etc/nixos/hardware-configuration.nix
```

Generate your own hardware informations

```
sudo nixos-generate-config --root /mnt
```

And then modify configs if you need.

Then you can install NixOS following the official guide

---

## Troubleshooting

### 1. Report an error 

```
error: all build users are currently in use; consider creating additional users and adding them to the 'nixbld' group
```

This may be because your computer has too many CPU cores (>= 32), you can try the following installation command

```
sudo nixos-install --max-jobs 32 --cores 32
```
---