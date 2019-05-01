job "bouncer" {
  datacenters = ["dc1"]

  group "lounge" {
    count = 1

    task "lounge" {
      driver = "docker"

      config {
        image = "thelounge/thelounge:3.0.1"
        port_map = {
            http = 9000
        }
        volumes = [
            "/var/eph/lounge:/var/opt/thelounge",
        ]
      }

      resources {
        cpu    = 500
        memory = 100

        network {
            port "http" {
                static = "9000"
            }
        }
      }
    }
  }
}
