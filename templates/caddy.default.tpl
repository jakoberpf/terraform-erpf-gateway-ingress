${domain} {
    reverse_proxy ${host}:${port} {
        transport http {%{ if "${https}" == "true" }
            tls
            tls_server_name ${domain}
            tls_insecure_skip_verify%{ endif }
        }
    }
    import cloudflare-tls-dns
    log {
        output file ${log_file_path}
    }
}