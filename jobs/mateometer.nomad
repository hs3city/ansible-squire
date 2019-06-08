job "mateometer" {
  datacenters = ["dc1"]

  group "mateometer" {
    count = 1

    task "mateometer" {
      driver = "docker"

      config {
        image = "allgreed/mateometer:preview1"

        port_map = {
            http = 8080
        }
      }

      resources {
        cpu    = 100
        memory = 50

        network {
            port "http" {
                static = "8080"
            }
        }
      }
    }
  }
}
