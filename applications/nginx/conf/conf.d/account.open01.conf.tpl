upstream account.open01.com{
     {{range service "account"}}
     server {{.Address}}:{{.Port}}
     {{end}}
     ip_hash;
}
server {
    listen      80;
    server_name account.open01.com;
    location / {
        proxy_pass http://account.open01.com;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        allow 211.103.193.66;
        deny all;
    }
}
