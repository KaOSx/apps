
pkgname=jdk
_major=8
_minor=112
_build=b15
_pkgver=${_major}u${_minor}
pkgver=${_major}.${_minor}
pkgrel=1
pkgdesc="Java Development Kit"
arch=('x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libx11' 'libxrender' 'libxslt' 'libxtst'
         'shared-mime-info' 'xdg-utils' 'alsa-lib' 'ttf-dejavu')
provides=("java-environment=$_major" "java-runtime=$_major")
backup=('etc/derby.conf'
        'etc/profile.d/jdk.csh'
        'etc/profile.d/jdk.sh')
install=jdk.install
# check version http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html
source=("http://download.oracle.com/otn-pub/java/jdk/${_pkgver}-$_build/jdk-${_pkgver}-linux-x64.tar.gz"
        'derby.conf'
        'derby.service'
        'java-mission-control.desktop'
        'java-monitoring-and-management-console.desktop'
        'java-policy-settings.desktop'
        'java-visualvm.desktop'
        'javaws-launcher'
        'jdk.csh'
        'jdk.sh')
md5sums=('de9b7a90f0f5a13cfcaa3b01451d0337'  
         '4bdff6982c66d24a879c424aaac3d04d'  
         '77f3b7ddf55c112f97a665a825bf764f'  
         '536ea84bba5eb6bfe8f601b41af9769c'  
         'da10de5e6507c392fc9871076ef53ec6' 
         'f4e25ef1ccef8d36ff2433c3987a64fe'  
         '35fd89c5c170021d2183593335703703'  
         '45c15a6b4767288f2f745598455ea2bf'  
         'e81bb7853b071df6adca0b90f0c2ac2d'  
         'a06d46b277e2926d73d2ee11c9950973')
         
# edit apps-x86_64-makepkg to use this DLAGENTS
DLAGENTS=('http::/usr/bin/curl -LC - -b "oraclelicense=a" -O')

package() {
  msg2 "Creating required dirs"
  cd jdk1.$_major.0_$_minor
  mkdir -p "$pkgdir"/{opt/java/,usr/{lib/{mozilla/plugins,systemd/system},share/licenses/jdk},etc/{.java/.systemPrefs,profile.d}}

  msg2 "Removing the redundancies"
  rm -r db/bin/*.bat jre/{plugin/,COPYRIGHT,LICENSE,*.txt} man/ja # lib/{desktop,visualvm/platform/docs}

  msg2 "Moving stuff in place"
  mv jre/lib/desktop/* man "$pkgdir"/usr/share/
  mv COPYRIGHT LICENSE *.txt "$pkgdir"/usr/share/licenses/jdk/
  mv * "$pkgdir"/opt/java/

  msg2 "Symlinking the plugin"
  ln -s /opt/java/jre/lib/amd64/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins/

  msg2 "Installing the scripts, .conf, .service and .desktops of our own"
  cd "$srcdir"
  install -m755 jdk.{,c}sh "$pkgdir"/etc/profile.d/
  install -m644 derby.conf "$pkgdir"/etc/
  install -m644 derby.service "$pkgdir"/usr/lib/systemd/system/
  install -m755 javaws-launcher "$pkgdir"/opt/java/jre/bin/
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  msg2 "Tweaking the javaws .desktop file"
  sed -e 's/Exec=javaws/&-launcher %f/' -e '/NoDisplay=true/d' -i "$pkgdir"/usr/share/applications/sun-javaws.desktop
}
