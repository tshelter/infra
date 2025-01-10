{ ... }: {
  virtualisation.oci-containers = {
    containers = {
      nginx = {
        image = "nginx:latest";
        ports = [ "8080:80" ];
      };
    };
  };
}
