job "grafana" {
  datacenters = ["dc1"]
  type = "system"

  group "grafana" {
    count = 1

    task "grafana" {
      driver = "docker"

      config {
        image = "grafana/grafana:5.1.0"
        port_map = {
            http = 3000
        }
        volumes = [
          "/etc/svc/grafana/grafana.ini:/etc/grafana/grafana.ini",
          "/etc/svc/grafana/datasource.yml:/etc/grafana/provisioning/datasources/default.yaml",
          "/var/eph/grafana/:/var/lib/grafana",
        ]
      }

      resources {
        cpu    = 500
        memory = 100

        network {
            port "http" {
                static = "3000"
            }
        }
      }
    }
  }
}
