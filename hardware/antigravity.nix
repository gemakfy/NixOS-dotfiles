{ lib
, stdenv
, autoPatchelfHook
, makeWrapper
, python3
# Графика и системные библиотеки
, alsa-lib
, at-spi2-atk
, at-spi2-core
, cairo
, cups
, dbus
, expat
, fontconfig
, freetype
, gdk-pixbuf
, glib
, gtk3
, libdrm
, libGL
, libnotify
, libsecret
, libxkbcommon
, mesa
, nspr
, nss
, pango
, systemd
, vulkan-loader
, wayland
, zlib
# X11
, libx11
, libxcomposite
, libxcursor
, libxdamage
, libxext
, libxfixes
, libxi
, libxrandr
, libxrender
, libxtst
, libxcb
}:

stdenv.mkDerivation rec {
  pname = "antigravity";
  version = "2.5.0";

  src = ./Antigravity.tar.gz;
  sourceRoot = "Antigravity-x64";

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
    python3
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    alsa-lib
    at-spi2-atk
    at-spi2-core
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    glib
    gtk3
    libdrm
    libGL
    libnotify
    libsecret
    libxkbcommon
    mesa
    nspr
    nss
    pango
    systemd
    vulkan-loader
    wayland
    zlib
    libx11
    libxcomposite
    libxcursor
    libxdamage
    libxext
    libxfixes
    libxi
    libxrandr
    libxrender
    libxtst
    libxcb
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/antigravity $out/bin $out/share/applications

    cp -r . $out/lib/antigravity/
    chmod -R u+w $out/lib/antigravity

    # --- Точный in-place патчинг без изменения размера и сдвига байт ---
    python3 - << "EOF"
import os, re, sys

out_dir = os.environ.get("out", "")
print(f"[*] Applying Open AG patches inside {out_dir}")

# 1. Патч main.js (обход проверки isGoogleInternal)
ide_re = re.compile(r"(resetIsTierGCPTos\(\),)this\.[A-Za-z_$0-9]+\.isGoogleInternal")
for root, _, files in os.walk(out_dir):
    for f in files:
        if f == "main.js":
            full_path = os.path.join(root, f)
            with open(full_path, "r", encoding="utf-8", errors="ignore") as fp:
                content = fp.read()
            new_content = ide_re.sub(r"\g<1>true", content)
            if new_content != content:
                print(f"[+] Patched main.js: {full_path}")
                with open(full_path, "w", encoding="utf-8") as fp:
                    fp.write(new_content)

# 2. Патч language_server: cmp byte[rax+8],0 ; je short -> mov byte[rax+8],1 ; nop*2
mgr_sig = re.compile(rb"\x80\x78\x08\x00\x74.\x48\x8b.\x24.\x48\x89.\x60", re.S)
mgr_fix = b"\xc6\x40\x08\x01\x90\x90"  # Ровно 6 байт

# 3. Патч CLI agy: cmp byte[rax+8],0 -> test rax,rax ; nop
cli_sig = re.compile(rb"\x48\x85\xc0\x0f\x84....\x80\x78\x08\x00\x0f\x85....", re.S)
cli_fix = b"\x48\x85\xc0\x90"  # Ровно 4 байта

for root, _, files in os.walk(out_dir):
    for f in files:
        full_path = os.path.join(root, f)
        if os.path.islink(full_path):
            continue

        if f in ("language_server", "language_server.exe"):
            with open(full_path, "rb") as fp:
                data = bytearray(fp.read())
            orig_len = len(data)
            matches = list(mgr_sig.finditer(data))
            if matches:
                for m in matches:
                    # In-place замена ровно 6 байт
                    data[m.start() : m.start() + len(mgr_fix)] = mgr_fix
                assert len(data) == orig_len, "File size corrupted!"
                with open(full_path, "wb") as fp:
                    fp.write(data)
                print(f"[+] Patched language_server ({len(matches)} match(es)): {full_path}")
            else:
                print(f"[-] Signature not found in language_server: {full_path}")

        elif f in ("agy", "antigravity_cli"):
            with open(full_path, "rb") as fp:
                data = bytearray(fp.read())
            orig_len = len(data)
            matches = list(cli_sig.finditer(data))
            if matches:
                for m in matches:
                    off = m.start() + 9
                    # In-place замена ровно 4 байт
                    data[off : off + len(cli_fix)] = cli_fix
                assert len(data) == orig_len, "File size corrupted!"
                with open(full_path, "wb") as fp:
                    fp.write(data)
                print(f"[+] Patched agy ({len(matches)} match(es)): {full_path}")
EOF

    # Делаем бинарники исполняемыми перед тем, как отработает autoPatchelfHook
    find $out/lib/antigravity -type f -exec chmod +x {} +

    makeWrapper $out/lib/antigravity/antigravity $out/bin/antigravity \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ libGL mesa vulkan-loader ]}" \
      --add-flags "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations"

    cat > $out/share/applications/antigravity.desktop << EOF
[Desktop Entry]
Name=Antigravity
Comment=Antigravity IDE
Exec=$out/bin/antigravity %F
Icon=antigravity
Type=Application
Categories=Development;IDE;
Terminal=false
StartupWMClass=Antigravity
EOF

    runHook postInstall
  '';

  meta = with lib; {
    description = "Google Antigravity IDE (Patched via Open AG Patcher)";
    homepage = "https://antigravity.google";
    platforms = [ "x86_64-linux" ];
    mainProgram = "antigravity";
  };
}
