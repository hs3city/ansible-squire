job "mikrotik_exporter" {
  datacenters = ["dc1"]

  group "mikrotik_exporter" {
    count = 1

    task "mikrotik_exporter" {
      driver = "docker"

      config {
        image = "allgreed/mikrotik-prometheus-exporter:preview0"
        args = [
            "-address", "10.14.10.1",
            "-device", "my_router",
            "-user", "prometheus",
            "-password", "ghJcdWs5eTxecRgJZpMfV7LJwn7E",
            "-with-dhcp",
        ]
        command = "mikrotik-exporter_linux_amd64"
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
