package start

import (
	"net/http"

	"github.com/google/http2preload"
)

// init registers HTTP handlers.
func init() {
	m, err := http2preload.ReadManifest("preload.json")
	if err != nil {
		// panic(err)
		http.HandleFunc("/", handleRoot)
	} else {
		http.Handle("/", m.Handler(handleRoot))
	}
}

// handleRoot serves the landing page.
func handleRoot(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "index.html")
}
