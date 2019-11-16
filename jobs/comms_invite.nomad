job "comms-invite" {
  datacenters = ["dc1"]

  group "comms-invite" {
    count = 1

    task "comms-invite" {
      driver = "docker"

      config {
        image = "hs3city/comms-invite:latest"
        port_map = {
            http = 8000
        }
        volumes = [
            "/etc/localtime:/etc/localtime:ro",
        ]
      }

      resources {
        cpu    = 500
        memory = 100
        network {
            port "http" {
                static = "9600"
            }
        }
      }
    }
  }
}
