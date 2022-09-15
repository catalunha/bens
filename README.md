# bens

A new Flutter project.

# Create
 $ flutter create --project-name=bens --org br.net.cemec --platforms android,web -a kotlin ./bens

# deploy app web
cd ~/myapp/cemec.net.br/bens && flutter build web && cd ./b4a/cemec-bens && b4a deploy

# deploy cloudCode
cd ~/myapp/cemec.net.br/bens/b4a/cemec-bens && b4a deploy


# tutoriais QRCode
https://pub.dev/packages/qr_flutter
https://medium.com/flutter-community/building-flutter-qr-code-generator-scanner-and-sharing-app-703e73b228d3
https://www.qrcode.com/en/about/version.html

https://qr.io/?gclid=Cj0KCQjw-pCVBhCFARIsAGMxhAd6YMnCz0cckN0sTSUhBbx1kCWxGKhDjU2enf1uQH_qSOIpPMLC91IaAnxKEALw_wcB

d4TQERAzDt

https://medium.flutterdevs.com/explore-barcode-scanner-in-flutter-b53c6d875444

# icon
https://appicon.co/


# App Google Play
Seguindo:
https://docs.flutter.dev/deployment/android
https://dhruvnakum.xyz/how-to-publish-flutter-app-on-play-store

catalunha@pop-os:~/myapp/cemec.net.br/bens/readme.files$ cd ..
catalunha@pop-os:~/myapp/cemec.net.br/bens$ mkdir keys
catalunha@pop-os:~/myapp/cemec.net.br/bens$ cd keys/
catalunha@pop-os:~/myapp/cemec.net.br/bens/keys$   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
Enter keystore password:  
Re-enter new password: 
What is your first and last name?
  [Unknown]:  bens
What is the name of your organizational unit?
  [Unknown]:  bens
What is the name of your organization?
  [Unknown]:  bens
What is the name of your City or Locality?
  [Unknown]:  gv
What is the name of your State or Province?
  [Unknown]:  mg
What is the two-letter country code for this unit?
  [Unknown]:  br
Is CN=bens, OU=bens, O=bens, L=gv, ST=mg, C=br correct?
  [no]:  yes

Generating 2,048 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 10,000 days
	for: CN=bens, OU=bens, O=bens, L=gv, ST=mg, C=br
[Storing /home/catalunha/upload-keystore.jks]
catalunha@pop-os:~/myapp/cemec.net.br/bens/keys$ cp /home/catalunha/upload-keystore.jks .
catalunha@pop-os:~/myapp/cemec.net.br/bens/keys$ ls
upload-keystore.jks
catalunha@pop-os:~/myapp/cemec.net.br/bens/keys$ mv upload-keystore.jks bens-keystore.jks
catalunha@pop-os:~/myapp/cemec.net.br/bens/keys$ ls
bens-keystore.jks
catalunha@pop-os:~/myapp/cemec.net.br/bens/keys$ 

catalunha@pop-os:~/myapp/cemec.net.br/bens/keys$ cd ..
catalunha@pop-os:~/myapp/cemec.net.br/bens$ cd android/
catalunha@pop-os:~/myapp/cemec.net.br/bens/android$ ls
app               gradle             gradlew.bat
bens_android.iml  gradle.properties  local.properties
build.gradle      gradlew            settings.gradle
catalunha@pop-os:~/myapp/cemec.net.br/bens/android$ nano key.properties
catalunha@pop-os:~/myapp/cemec.net.br/bens/android$ cat key.properties 
storePassword=android
keyPassword=android
keyAlias=upload
storeFile=/home/catalunha/myapp/cemec.net.br/bens/keys/bens-keystore.jks
catalunha@pop-os:~/myapp/cemec.net.br/bens/android$ 

edite android/app/build.gradle
add antes do android block
```
   def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }

   android {
         ...
   }

```
e no lugar do buildTypes
```
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release
       }
   }

```

catalunha@pop-os:~/myapp/cemec.net.br/bens$ flutter clean

catalunha@pop-os:~/myapp/cemec.net.br/bens$ flutter build appbundle

# aws
chmod na pem para:
-r--------  1 catalunha catalunha 1674 Jul 14 10:18 migm.pem

cd ~/myapp/cemec.net.br/bens/aws
ssh -i migm.pem ubuntu@3.87.44.142


ubuntu@ip-172-31-90-181:~$ ls
ubuntu@ip-172-31-90-181:~$ sudo mkdir /opt/nginx-ssl
ubuntu@ip-172-31-90-181:~$ cd /opt/nginx-ssl/
ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ 

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir api
ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir webserver

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir -p webserver/api/bens
ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir -p webserver/conf.d
ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir -p webserver/html
ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir -p webserver/html/bens

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir -p webserver/html/bens/privacy-policy
ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir -p webserver/html/bens/terms-of-use
ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ 

verificar permissão de arquivos de privacy no servidor para ubuntu

catalunha@pop-os:~/myapp/cemec.net.br/bens/aws$ scp -r -i migm.pem /home/catalunha/myapp/cemec.net.br/bens/aws/docker-compose/webserver/html/bens/privacy-policy/index.html   ubuntu@3.214.140.210:/opt/nginx-ssl/webserver/html/bens/privacy-policy
index.html                                    100%   15KB  47.9KB/s   00:00    
catalunha@pop-os:~/myapp/cemec.net.br/bens/aws$ scp -r -i migm.pem /home/catalunha/myapp/cemec.net.br/bens/aws/docker-compose/webserver/html/bens/terms-of-use/index.html   ubuntu@3.214.140.210:/opt/nginx-ssl/webserver/html/bens/terms-of-useindex.html                                    100%   13KB  82.1KB/s   00:00 

catalunha@pop-os:~/myapp/cemec.net.br/bens/aws$ scp -r -i migm.pem /home/catalunha/myapp/cemec.net.br/bens/build/web/*   ubuntu@3.214.140.210:/opt/nginx-ssl/webserver/public_html/bens

# instalando docker
ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo apt-get update

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo mkdir -p /etc/apt/keyrings

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ sudo apt-get update

ubuntu@ip-172-31-90-181:/opt/nginx-ssl$ tree -Lpu 4
[drwxr-xr-x root    ]  .
├── [drwxr-xr-x root    ]  certbot
│   ├── [drwxr-xr-x root    ]  conf
│   │   ├── [drwx------ root    ]  accounts  [error opening dir]
│   │   ├── [drwx------ root    ]  archive  [error opening dir]
│   │   ├── [drwxr-xr-x root    ]  csr
│   │   │   ├── [-rw-r--r-- root    ]  0000_csr-certbot.pem
│   │   │   ├── [-rw-r--r-- root    ]  0001_csr-certbot.pem
│   │   │   └── [-rw-r--r-- root    ]  0002_csr-certbot.pem
│   │   ├── [drwx------ root    ]  keys  [error opening dir]
│   │   ├── [drwx------ root    ]  live  [error opening dir]
│   │   ├── [drwxr-xr-x root    ]  renewal
│   │   │   └── [-rw-r--r-- root    ]  cemec.net.br.conf
│   │   └── [drwxr-xr-x root    ]  renewal-hooks
│   │       ├── [drwxr-xr-x root    ]  deploy
│   │       ├── [drwxr-xr-x root    ]  post
│   │       └── [drwxr-xr-x root    ]  pre
│   ├── [drwxr-xr-x root    ]  data
│   └── [drwxr-xr-x root    ]  logs
│       ├── [-rw-r--r-- root    ]  letsencrypt.log
│       ├── [-rw-r--r-- root    ]  letsencrypt.log.1
│       ├── [-rw-r--r-- root    ]  letsencrypt.log.2
│       ├── [-rw-r--r-- root    ]  letsencrypt.log.3
│       ├── [-rw-r--r-- root    ]  letsencrypt.log.4
│       ├── [-rw-r--r-- root    ]  letsencrypt.log.5
│       ├── [-rw-r--r-- root    ]  letsencrypt.log.6
│       └── [-rw-r--r-- root    ]  letsencrypt.log.7
├── [drwxr-xr-x root    ]  dhparam
│   └── [-rw-r--r-- root    ]  dhparam-2048.pem
├── [-rw-r--r-- root    ]  docker-compose.yml
└── [drwxr-xr-x root    ]  webserver
    ├── [drwxr-xr-x root    ]  conf.d
    │   └── [-rw-r--r-- root    ]  bens.conf
    └── [drwxr-xr-x ubuntu  ]  public_html
        └── [drwxrwxr-x ubuntu  ]  bens
            ├── [drwxrwxr-x ubuntu  ]  assets
            ├── [drwxrwxr-x ubuntu  ]  canvaskit
            ├── [-rw-rw-r-- ubuntu  ]  favicon.png
            ├── [-rw-rw-r-- ubuntu  ]  flutter.js
            ├── [-rw-rw-r-- ubuntu  ]  flutter_service_worker.js
            ├── [drwxrwxr-x ubuntu  ]  icons
            ├── [-rw-rw-r-- ubuntu  ]  index.html
            ├── [-rw-rw-r-- ubuntu  ]  main.dart.js
            ├── [-rw-rw-r-- ubuntu  ]  manifest.json
            ├── [drwxrwxr-x ubuntu  ]  privacy-policy
            ├── [drwxrwxr-x ubuntu  ]  terms-of-use
            └── [-rw-rw-r-- ubuntu  ]  version.json


catalunha@pop-os:~/myapp/cemec.net.br/bens$ flutter clean

catalunha@pop-os:~/myapp/cemec.net.br/bens$ flutter build web

catalunha@pop-os:~/myapp/cemec.net.br/bens$ flutter build appbundle


A cada nova versão mudar em:
android/local.properties
flutter.versionName=1.0.2
flutter.versionCode=2
e em
pubspec.yaml
version: 1.0.2+2