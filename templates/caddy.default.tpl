${domain} {
    reverse_proxy ${host}:${port} {
        transport http {
            tls_insecure_skip_verify
        }
    }
    import cloudflare-tls-dns
    log {
        output file ${log_file_path}
    }
}