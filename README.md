# Phương pháp 1:
##container gồm nginx và php
- SSL với localhost: add .pem
  - chrome://settings/certificates
  - about:preferences#privacy
- docker compose build
- docker compose up
- Truy cập: https://pictshare.meey.dev

# Phương pháp 2:
##container nginx và container php
- SSL với localhost: add .pem
  - chrome://settings/certificates
  - about:preferences#privacy
- docker compose -f docker-compose-2.yml build
- docker compose -f docker-compose-2.yml up
- Truy cập: https://pictshare.meey.dev

