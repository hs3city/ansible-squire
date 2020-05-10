job "huginn" {
  datacenters = ["dc1"]

  group "huginn" {
    count = 1

    task "huginn" {
      driver = "docker"

      env {
      }

      config {
        image = "huginn/huginn"
        port_map = {
            http = 3000
        }
        volumes = [
            "/etc/localtime:/etc/localtime:ro",
        ]
      }

      resources {
        cpu    = 500
        memory = 2000
        network {
            port "http" {
                static = "9300"
            }
        }
      }
    }
  }
}
