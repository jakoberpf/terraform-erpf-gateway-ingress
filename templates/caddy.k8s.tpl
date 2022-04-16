${domain} {
    reverse_proxy ${host}:${port} {
        transport http {
            tls
            tls_insecure_skip_verify
        }
    }
    header_up X-Forwarded-Proto https
    log {
        output file ${log_file_path}
    }
}