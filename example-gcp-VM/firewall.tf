resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]              
  }                                 #tcp access to port 80

  source_ranges = ["0.0.0.0/0"]   
  target_tags   = ["http-server"] 
  }                                  
                                   /*  source_ranges = ["0.0.0.0/0"]:-  means all source
                                    target_tags   = ["http-server"]:- this tell on which instance the firewall rule is applicable
                                   if not explicit then firewall rule will be applicable to all instance
                                   */