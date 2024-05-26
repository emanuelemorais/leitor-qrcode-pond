# Aplicativo que transforma imagem colorida em preto e branco 

> IMPORTANTE: Prof Murilo, o repositório se chamar leitor-qrcode-pond pois inicialmente achei que esse era o objetivo da atividade, mas em seguida entendi que era para manipular uma imagem. Como já havia mandado o link no adalove mantive o nome para que o link continue funcionando. Apesar da confusão, o código aqui se trata de uma aplicativo que tranforma imagem colorida em preto e branco. :) 

## Como rodar

1. Clone esse repositório;
2. Para rodar o backend entre em `backend` e rode comando abaixo:

```
make env
```
Esse comando irá criar um arquivo .env que deve conter as seguinter informações:

```
POSTGRES_URL="postgres://user:password@host.docker.internal:5432/db?sslmode=disable"
JWT_SECRET_KEY="secret"
```
3. Em seguida rode o comando abaixo que irá executar o compose da API em microserviços:
```
make run
```
Isso irá iniciar o backend.

5. Para rodar o aplicativo primeiro abra o simulador. Para isso execute no VS Code o comando Crtl + Shift + P . Isso ira abrir um menu. Clique na opção Flutter: Launch Emulator.

4. Para rodar o aplicativo entre em `app` e rode em seguida os comandos abaixos:

```
flutter pub get
flutter run
```

## Video

https://drive.google.com/file/d/1Mnxz7uUNzomAxMvgwsv9wpuCxuqjMEQ8/view?usp=sharing

