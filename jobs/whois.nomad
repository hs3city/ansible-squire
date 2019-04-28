job "whois" {
  datacenters = ["dc1"]

  group "whois" {
    count = 1

    task "whois" {
      driver = "docker"

      env {
        SECRET_KEY = "fq6RlW1wZ71wl2rlHnrphvGe8uOoB7ioHKWm0fBAnmlyHxRFtWWgawrsGsIw3MBI"
      }

      config {
        image = "hs3city/whois:latest"
        port_map = {
            http = 8000
        }
        volumes = [
            "/var/eph/whois:/data",
            "/etc/localtime:/etc/localtime:ro",
        ]
      }

      resources {
        cpu    = 500
        memory = 100
        network {
            port "http" {
                static = "6000"
            }
        }
      }
    }
  }
}
