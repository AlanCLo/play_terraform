provider "google" {
  project     = "alanlo-sandbox"
  region      = "australia-southeast1"
}

resource "random_id" "instance_id" {
  byte_length = 8
}

resource "google_compute_instance" "default" {
  name = "play-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone = "australia-southeast1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  metadata_startup_script = "${file("./startup_script.sh")}"

  network_interface {
    network = "default"

    access_config {
      # Include this section to give VM an external ip address
    }
  }

  metadata = {
    ssh-keys = "gcpuser:${file("~/.ssh/id_ed25519.pub")}"
  }

}

resource "google_compute_firewall" "default" {
  name = "flask-app-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["5000"]
  }
}


output ip {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

