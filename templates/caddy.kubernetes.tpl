${domain}:6443 {
    reverse_proxy ${host}:${port} {
        header_up X-Forwarded-Proto https
        header_up X-Forwarded-Ssl on
        transport http {
            tls_server_name ${domain}
        }
    }
    log {
        output file ${log_file_path}
    }
}