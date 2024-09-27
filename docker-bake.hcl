target "docker-metadata-action" {
  tags = ["shower:local"]
}

target "default" {
  inherits = ["docker-metadata-action"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
}

target "artifact" {
  inherits = ["docker-metadata-action"]
  target = "artifact"
  output = ["type=local,dest=./artifact"]
}

target "artifact-linux" {
  inherits = ["artifact"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
}

target "release" {
  target = "release"
  output = ["type=local,dest=./release"]
  contexts = {
    artifacts = "./artifact"
  }
}
