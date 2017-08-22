upstream www.open01.com{
     {{range service "official"}}
     server {{.Address}}:{{.Port}}
     {{end}}
     ip_hash;
}

server {
    listen      80;
    server_name www.open01.com open01.com;

    location / {
        proxy_pass http://www.open01.com;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}

server {
    listen 443;
    server_name www.open01.com open01.com;
    ssl on;

    ssl_certificate   /etc/nginx/cert/www/213973194460923.pem;
    ssl_certificate_key  /etc/nginx/cert/www/213973194460923.key;
    ssl_session_timeout 5m;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;

    location / {
        proxy_pass http://www.open01.com;

        proxy_set_header Host $host;

        proxy_set_header X-Real-IP $remote_addr;

        proxy_set_header REMOTE-HOST $remote_addr;

        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

 # redirect server error pages to the static page /50x.html
 #     u           error_page   500 502 503 504  /50x.html;
       error_page   500 502 503 504  /50x.html;
    location = /50x.html {
       root   html;
                             }
    }
