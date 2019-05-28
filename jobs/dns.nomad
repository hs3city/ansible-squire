job "dns" {
  datacenters = ["dc1"]

  group "bind" {
    count = 1

    task "bind" {
      driver = "docker"

      config {
        image = "ventz/bind:9.12.4_p1-r1-fix1"
        port_map = {
            dns = 53
        }
        volumes = [
            "/var/eph/bind:/etc/bind",
        ]
      }

      resources {
        cpu    = 500
        memory = 100
        network {
            port "dns" {
                static = "53"
            }
        }
      }
    }
  }
}
