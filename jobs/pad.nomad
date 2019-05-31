job "pad" {
  datacenters = ["dc1"]

  group "etherpad-lite" {
    count = 1

    task "etherpad-lite" {
      driver = "docker"

      config {
        image = "fuerst/etherpad-docker:latest"
	      volumes = [
            "/var/eph/etherpad-lite:/opt/etherpad-lite/var",
        ]
        port_map = {
            http = 9001
        }
      }

      resources {
        cpu    = 500
        memory = 250

        network {
            port "http" {
                static = "9400"
            }
        }
      }
    }
  }
}
