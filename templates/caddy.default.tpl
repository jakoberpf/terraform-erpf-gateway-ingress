${domain} {
    reverse_proxy ${host}:${port} {
        transport http {
        }
    }
    import cloudflare-tls-dns
    log {
        output file ${log_file_path}
    }
}