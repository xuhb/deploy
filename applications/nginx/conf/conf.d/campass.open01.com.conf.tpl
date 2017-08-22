upstream campass.open01.com {
     {{range service "campass"}}
     server {{.Address}}:{{.Port}}
     {{end}}
     ip_hash;
}

upstream nodejs{
     {{range service "uploader"}}
     server {{.Address}}:{{.Port}}
     {{end}}
     ip_hash;
}

server {
    listen      80;
    server_name campass.open01.com;

    location / {
        root /etc/nginx/html/campass;
        index  login.html;
    }

    location ^~ /api/ {
        rewrite /api/(.+)$ /$1 break;
        proxy_set_header Host $host;
        proxy_pass http://campass.open01.com;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location ^~ /data/ {
        rewrite  /$1 break;
        proxy_set_header Host $host;
        proxy_pass http://campass.open01.com;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location /ws/ {
        proxy_pass http://campass.open01.com;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_read_timeout 3600s;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

        location  /upload {
          proxy_pass      http://nodejs;
      }


    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   html;
    }
}

server {
    listen 443;
    server_name campass.open01.com;
    ssl on;

    ssl_certificate   /etc/nginx/cert/campass/213973194370923.pem;
    ssl_certificate_key  /etc/nginx/cert/campass/213973194370923.key;
    ssl_session_timeout 5m;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;

    location / {
        root /etc/nginx/html/campass;
        index  login.html;
    }


     location ^~ /api/ {
        rewrite /api/(.+)$ /$1 break;
        proxy_set_header Host $host;
        proxy_pass http://campass.open01.com;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location ^~ /data/ {
        rewrite  /$1 break;
        proxy_set_header Host $host;
        proxy_pass http://campass.open01.com;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location /ws/ {
        proxy_pass http://campass.open01.com;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_read_timeout 3600s;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

      location  /upload {
          proxy_pass      http://nodejs;
      }


    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   html;
    }
}
