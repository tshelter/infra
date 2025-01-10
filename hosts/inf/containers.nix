{ ... }: {
  virtualisation.oci-containers = {
    containers = {
      nginx = {
        image = "nginx:1.27.3";
        ports = [ "80:80" ];
      };
    };
  };
}
