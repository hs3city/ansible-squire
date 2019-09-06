job "spotty-kiwi" {
  datacenters = ["dc1"]

  group "spotty-kiwi" {
    count = 1

    task "spotty-kiwi" {
      driver = "docker"

      config {
        image = "hs3city/spotty-kiwi:0.1.0"
        port_map = {
            http = 80
        }
        volumes = [
            "/var/eph/spotty-kiwi/.env:/app/.env",
        ]
      }

      resources {
        cpu    = 500
        memory = 100
        disk   = 50
        network {
            port "http" {
                static = "9700"
            }
        }
      }
    }
  }
}
