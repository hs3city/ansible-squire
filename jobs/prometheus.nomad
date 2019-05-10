job "prometheus" {
  datacenters = ["dc1"]
  type = "system"

  group "prometheus" {
    count = 1

    task "prometheus" {
      driver = "docker"

      config {
        image = "prom/prometheus:v2.9.2"
        port_map = {
            http = 9090
        }
        volumes = [
            "/etc/svc/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml",
            "/var/eph/prometheus/:/prometheus",
        ]
      }

      resources {
        cpu    = 200
        memory = 100

        network {
            port "http" {
                static = "9090"
            }
        }
      }
    }
  }
}
