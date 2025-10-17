{ pkgs, googleCloudProjectId, googleCloudLocation, ... }: {
  packages = [
    pkgs.j2cli
    pkgs.nixfmt
  ];
  bootstrap = ''
    echo "$WS_NAME"
    cp -rf ${./.}/starter_agent "$WS_NAME"
    chmod -R +w "$WS_NAME"
    mkdir "$WS_NAME"/.idx
    ls -ltra "$WS_NAME"
    googleCloudProjectId=${googleCloudProjectId} googleCloudLocation=${googleCloudLocation} j2 ${./devNix.j2} -o "$WS_NAME"/.idx/dev.nix
    ls -ltra "$WS_NAME"
    nixfmt "$WS_NAME"/.idx/dev.nix
    mv "$WS_NAME" "$out"

    mkdir -p "$out/.idx"
    chmod -R u+w "$out"
    cp -rf ${./.}/airules.md "$out/.idx/airules.md"
    cp -rf "$out/.idx/airules.md" "$out/GEMINI.md"
    chmod -R u+w "$out"
  '';
}