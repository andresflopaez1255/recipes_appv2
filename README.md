<h1 align="center">🧩 Manager Accounts</h1>

<p align="center">
  <img src="https://firebasestorage.googleapis.com/v0/b/portafolio-dd96b.appspot.com/o/demo_app.gif?alt=media&token=f9ab0fae-26cf-4e20-bd46-63ca8efeb52d" alt="Demo App" width="300">
</p>

<p align="center">
  <b>Aplicación Flutter para la gestión de cuentas de usuario.</b><br>
  Arquitectura limpia, modular y lista para escalar 🚀
</p>

<p align="center">
  <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white"/></a>
  <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white"/></a>
  <img src="https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20Web-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/github/license/andresflopaez1255/manager_accounts?style=for-the-badge"/>
</p>

---

## ✨ Características principales

- ✅ **Gestión completa de cuentas:** crear, editar, eliminar y listar usuarios.  
- 🔐 **Autenticación y roles:** login, registro y control de permisos.  
- 🌐 **Integración con backend:** API REST o Firebase.  
- 🧩 **Arquitectura modular:** separación clara entre UI, lógica y servicios.  
- 📱 **Multiplataforma:** Android, iOS y Web.  
- ⚙️ **Gestión de estado moderna:** Provider / Bloc / Riverpod.  
- 💡 **Código limpio, documentado y mantenible.**

---

## 🧱 Estructura del proyecto

```bash
manager_accounts/
├── android/
├── ios/
├── lib/
│   ├── models/        # Entidades (User, Account, etc.)
│   ├── services/      # Conexión con backend / Firebase
│   ├── providers/     # Lógica de negocio / estado
│   ├── views/         # Pantallas de UI
│   ├── widgets/       # Componentes reutilizables
│   └── main.dart
├── test/              # Pruebas unitarias e integradas
└── pubspec.yaml

