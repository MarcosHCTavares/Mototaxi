---

# 🛵 MotoTáxi App - Flutter 🚦

Aplicativo de Mototáxi desenvolvido em Flutter, com foco em corridas rápidas entre passageiro e mototaxistas, similar ao modelo do Uber, mas voltado para transporte em motocicletas.

---

## 📱 Funcionalidades Incluídas no MVP:

✅ Tela de Login simples (escolha de perfil: Passageiro ou Mototaxista)
✅ Mapa com localização inicial do Passageiro (Google Maps Flutter)
✅ Tela de Solicitação de Corrida com cálculo real de distância e duração (Google Directions API)
✅ Estimativa de preço baseada na distância
✅ Estrutura de rotas bem organizada
✅ Layout limpo e pronto para expansão futura

---

## 🗂️ Estrutura de Pastas:

```
lib/
├── main.dart
├── routes/
│   └── app_routes.dart
├── services/
│   └── location_service.dart
├── views/
│   ├── auth/
│   │   └── login.dart
│   ├── driver/
│   │   └── home_driver.dart
│   ├── passenger/
│   │   ├── home_passenger.dart
│   │   └── ride_request.dart
│   └── shared/
│       └── custom_button.dart
```

---

## 🔑 Configuração Inicial:

1. **Google Cloud Platform:**

   * Crie um projeto no [Google Cloud Console](https://console.cloud.google.com/)
   * Ative as seguintes APIs:

     * Maps SDK for Android
     * Maps SDK for iOS
     * Directions API
   * Gere uma **API Key**

2. **Adicione a API Key:**

* No Android:
  Abra: `android/app/src/main/AndroidManifest.xml`

  ```xml
  <meta-data android:name="com.google.android.geo.API_KEY" android:value="SUA_API_KEY_AQUI"/>
  ```

* No iOS:
  Abra: `ios/Runner/AppDelegate.swift` ou `AppDelegate.m`

  ```swift
  GMSServices.provideAPIKey("SUA_API_KEY_AQUI")
  ```

3. **Dependências do projeto (já inclusas):**

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_maps_flutter: ^2.5.0
  geolocator: ^10.0.0
  http: ^1.2.0
  provider: ^6.1.2
```

---

## 🚗 Como Executar:

```bash
flutter pub get
flutter run
```

---

## ✅ Próximos Passos para Evolução:

* Autenticação com Firebase (e-mail, telefone)
* Geolocalização em tempo real para motoristas
* Aceite de corridas pelo mototaxista
* Integração com sistema de pagamentos (PIX ou cartão)
* Notificações Push
* Chat entre Passageiro e Mototaxista
* Histórico de corridas

---

## 📌 Observação:

Este projeto é uma base inicial (MVP) e está pronto para receber melhorias e personalizações conforme a sua necessidade.

---

**Feito por:** Marcos Henrique Costa Tavares 🚀
**Tecnologia:** Flutter 3.x + Google Maps API

---
