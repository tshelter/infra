{ ... }: {
  virtualisation.oci-containers = {
    enable = true;
    containers = {
      nginx = {
        image = "nginx:latest";
        ports = [ "8080:80" ];
      };
    };
  };
}
