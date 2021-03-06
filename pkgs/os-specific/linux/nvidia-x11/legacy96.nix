{stdenv, fetchurl, kernel, xlibs, zlib, gtk, atk, pango, glib}:

let 

  versionNumber = "96.43.20";

in

stdenv.mkDerivation {
  name = "nvidia-x11-${versionNumber}-${kernel.version}";
  
  builder = ./builder-legacy.sh;
  
  src =
    if stdenv.system == "i686-linux" then
      fetchurl {
        url = "http://us.download.nvidia.com/XFree86/Linux-x86/${versionNumber}/NVIDIA-Linux-x86-${versionNumber}-pkg0.run";
        sha256 = "05vm36jnydp4cfdkfvrvxczd64i3f0pp0yp7dn8y8pklrxi80xxw";
      }
    else if stdenv.system == "x86_64-linux" then
      fetchurl {
        url = "http://us.download.nvidia.com/XFree86/Linux-x86_64/${versionNumber}/NVIDIA-Linux-x86_64-${versionNumber}-pkg0.run";
        sha256 = "0a8ninp4wyql3xh6z93dzhbacvz7g0h8gs4pg5279a0i6h05wb1w";
      }
    else throw "nvidia-x11 does not support platform ${stdenv.system}";

  inherit versionNumber kernel;

  # Only for kernels 3.4 and over
  # Patches taken from arch linux AUR 
  # https://aur.archlinux.org/packages.php?ID=57698
  kpatches = stdenv.lib.optionals (stdenv.lib.strings.versionOlder "3.4" kernel.version)
    [ ./acpixf.patch
      ./generated.patch
      ./patchlevel.patch
      ./switch_to.patch
    ];

  dontStrip = true;

  glPath = stdenv.lib.makeLibraryPath [xlibs.libXext xlibs.libX11 xlibs.libXrandr];

  cudaPath = stdenv.lib.makeLibraryPath [zlib stdenv.gcc.gcc];

  programPath = stdenv.lib.makeLibraryPath [ gtk atk pango glib xlibs.libXv ];

  meta = {
    homepage = http://www.nvidia.com/object/unix.html;
    description = "X.org driver and kernel module for Legacy NVIDIA graphics cards";
    license = "unfree";
  };
}
