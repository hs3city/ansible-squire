job "reverse_proxy" {
  datacenters = ["dc1"]

  type = "system"

  group "nginx" {
    count = 1

    task "nginx" {
      driver = "docker"

      config {
        image = "nginx:1.16-alpine"
        network_mode = "host"
        volumes = [
            "/srv:/usr/share/nginx/html/",
            "/etc/svc/nginx/:/etc/nginx/conf.d/",
            "/var/eph/letsencrypt:/etc/letsencrypt",
        ]
      }

      resources {
        cpu    = 500
        memory = 200
      }
    }
  }
}
