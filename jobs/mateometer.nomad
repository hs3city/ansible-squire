job "mateometer" {
  datacenters = ["dc1"]

  group "mateometer" {
    count = 1

    task "mateometer" {
      driver = "docker"

      config {
        image = "allgreed/mateometer:preview3"

        port_map = {
            http = 8000
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
