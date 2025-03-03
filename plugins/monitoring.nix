{ pkgs, lib, ... }: 
{
  services = {
    prometheus = {
      enable = true;
      scrapeConfigs = [
        {
          job_name = "node";
          static_configs = [
            { targets = [ "localhost:9100" ]; }
          ];
        }
      ];
    };

    prometheus.exporters.node = {
      enable = true;
      port = 9100;
      openFirewall = true;
    };

    grafana = {
      enable = true;
      dataDir = "/var/lib/grafana";
      provision = {
        enable = true;
        datasources = {
          settings = {
            apiVersion = 1;
            datasources = [
              {
                name = "Prometheus";
                type = "prometheus";
                url = "http://localhost:9090";
                access = "proxy";
                isDefault = true;
              }
            ];
          };
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 3000 9090 9100 ];
}
