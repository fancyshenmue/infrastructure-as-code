{{ range $group, $items := tree "nginx/external/site" | explode }}
    {{- range $site, $siteinfo := tree ($group | printf "nginx/external/site/%s") | explode }}
        {{- $key := printf "nginx/external/site/%s/%s" $group $site }}
        {{- with $info := key $key | parseJSON }}

# {{ $group }} {{ $site }}
server {
    listen  80;
    server_name  {{ $info.server_name }};
    underscores_in_headers  on;

    # include files to enhance function or security etc ...
    include conf.d/include/files_filter;
    include conf.d/include/drop_params;

    add_header X-Frame-Options "SAMEORIGIN";

    # prevent xss attack
    add_header X-XSS-Protection "1; mode=block";

    # it prevents the browser from doing MIME-type sniffing
    add_header X-Content-Type-Options nosniff;

    keepalive_timeout 65;

    access_log {{ $info.access_log }} main;
    error_log  {{ $info.error_log }} warn;

    location / {
        try_files $uri @proxy;
    }

    location @proxy {
        proxy_redirect   off;
        proxy_buffering  on;
        proxy_intercept_errors on;
        proxy_next_upstream error timeout http_502 http_503 http_504;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Scheme $scheme;
        proxy_redirect http:// $scheme://;
        proxy_pass {{ $info.proxy_pass }};
    }

}

server {
    listen  80;
    server_name  api.{{ $info.server_name }};
    underscores_in_headers  on;

    # include files to enhance function or security etc ...
    include conf.d/include/files_filter;
    include conf.d/include/drop_params;

    # iframe, prevent clickjacking
    add_header X-Frame-Options "SAMEORIGIN";

    # prevent xss attack
    add_header X-XSS-Protection "1; mode=block";

    # it prevents the browser from doing MIME-type sniffing
    add_header X-Content-Type-Options nosniff;

    keepalive_timeout 65;

    access_log {{ $info.access_log }} main;
    error_log  {{ $info.error_log }} warn;

    location /websocket {
        proxy_redirect   off;
        proxy_buffering  on;
        proxy_intercept_errors on;
        proxy_next_upstream error timeout http_502 http_503 http_504;
        #### don't use "proxy_set_header Host $host;" in websocket path
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
        proxy_http_version 1.1;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Scheme $scheme;
        proxy_redirect http:// $scheme://;
        proxy_pass {{ $info.proxy_pass_api }};
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }

    location @proxy {
        include conf.d/include/method_params;
        proxy_redirect   off;
        proxy_buffering  on;
        proxy_intercept_errors on;
        proxy_next_upstream error timeout http_502 http_503 http_504;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Scheme $scheme;
        proxy_redirect http:// $scheme://;
        proxy_pass {{ $info.proxy_pass_api }};
    }
}
# end of {{ $group }} {{ $site }}
        {{- end }}
    {{- end }}
{{ end -}}
