{ pkgs, googleCloudProjectId ? "<your_project_id>" , googleCloudLocation ? "<your_location>", ... }: {
  packages = [
    pkgs.j2cli
    pkgs.nixfmt
  ];
  bootstrap = ''
    echo "$WS_NAME"
    cp -rf ${./.}/agents "$WS_NAME"/agents
    chmod -R +w "$WS_NAME"
    cp ${./requirements.txt} "$WS_NAME"/requirements.txt
    cp ${./.gitignore} "$WS_NAME"/.gitignore
    
    mkdir "$WS_NAME"/.idx
    googleCloudProjectId="${googleCloudProjectId}" googleCloudLocation="${googleCloudLocation}" j2 ${./devNix.j2} -o "$WS_NAME"/.idx/dev.nix
    nixfmt "$WS_NAME"/.idx/dev.nix
    mv "$WS_NAME" "$out"

    mkdir -p "$out/.idx"
    chmod -R u+w "$out"
    cp -rf ${./.}/airules.md "$out/.idx/airules.md"
    cp -rf "$out/.idx/airules.md" "$out/GEMINI.md"
    chmod -R u+w "$out"
  '';
}

# googleCloudProjectId=1 googleCloudLocation=2 j2 ./devNix.j2 -o ./dev.nix