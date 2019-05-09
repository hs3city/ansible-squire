job "mikrotik_exporter" {
  datacenters = ["dc1"]

  group "mikrotik_exporter" {
    count = 1

    task "mikrotik_exporter" {
      driver = "docker"

      config {
        image = "allgreed/mikrotik-prometheus-exporter:preview0"

        args = [
            "--config-file", "/etc/config.yml",
        ]
        command = "mikrotik-exporter_linux_amd64"

        volumes = [
            "/etc/svc/mikrotik_exporter/config.yml:/etc/config.yml",
        ]

        port_map = {
            http = 9436
        }
      }

      resources {
        cpu    = 100
        memory = 50

        network {
            port "http" {
                static = "9200"
            }
        }
      }
    }
  }
}
