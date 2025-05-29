# Atividade 5

## 🚀 Aplicativo Flutter com Login, Splash, Onboarding e Temas

Este projeto é uma atividade prática final que simula o fluxo de entrada de um aplicativo real. O app foi desenvolvido com foco em boas práticas de usabilidade, animações modernas e código reutilizável com widgets customizados.


## 🎯 Funcionalidades

- Splash screen nativa com o pacote flutter_native_splash
- Splash Flutter com animação Lottie (fade-in)
- Onboarding com 3 telas informativas
- Tela de login com validação e 3 botões funcionais
- Suporte completo a tema claro e escuro
- Dois widgets reutilizáveis: `LoginTextFormField` e `LottieWidget`

## 📲 Pré-requisitos

- Flutter 3.x
- Dart SDK
- Android Studio ou VS Code com plugins Flutter/Dart
- Emulador Android ou dispositivo físico

## 🚀 Como executar

1. **Clone o repositório:**
```
git clone https://github.com/seu-usuario/atividade_final_flutter_login.git
cd atividade_final_flutter_login
```
2. **Instale as dependências:**
```
flutter pub get
```

3. **Gere a splash nativa:**
```
flutter pub run flutter_native_splash:create
```
4. **Execute o aplicativo:**
```
flutter run
```

## 📦 Pacotes utilizados

| **Pacote**            | **Função**                                  |
|-----------------------|---------------------------------------------|
| `flutter_native_splash` | Splash screen nativa  |
| `lottie`                | Animações em vetor para Splash      |
| `provider`                  | Gerenciamento de estado            |

## 🎬 Fluxo do App

1. Splash Nativa:
  - Exibe instantaneamente ao iniciar o app.
  - Configurada via flutter_native_splash.

2. Splash Animada com Lottie:
  - Animação com fade-in utilizando arquivos .json Lottie.

3. Onboarding (3 páginas):
  - Apresentação com imagens e textos explicativos.
  - Botão "Começar" redireciona para tela de login.

4. Tela de Login:
  - Campos de e-mail e senha com validação.
  - Botões: "Entrar", "Registrar-se", "Esqueci minha senha".
  - Utiliza o widget customizado LoginTextFormField.

5. Temas (Light & Dark):
  - Alternância de tema em tempo real com botão na AppBar.
  - Implementação via light_theme.dart, dark_theme.dart e ThemeProvider.

## 🧩 Widgets Customizados

🔤 `LoginTextFormField`

- Campo de texto customizado para login
- Suporte a foco, hover e validação
- Reutilizável em múltiplos formulários

🎞️ `LottieWidget` (Diferencial)

- Componente reutilizável para exibir animações Lottie
- Permite configuração de animação, tamanho, alinhamento e repetição
- Usado na Splash Flutter e outras partes visuais do app

```dart
LottieWidget(
  assetPath: 'assets/animations/loading.json',
  repeat: true,
  height: 150,
)
```

🧭 `CustomAppBar`

- AppBar customizada para uso em todas as telas  
- Integra controle de tema claro/escuro com `CupertinoSwitch`  
- Reage dinamicamente ao estado de tema via `Provider`  
- Estilização completa com `TextStyle` e `ThemeProvider`  
- Responsiva e sem repetição de código  

```dart
Scaffold(
  appBar: CustomAppBar(),
  body: ...
)
```

📝 `CustomCard`

- Componente visual para exibir título, estrelas e descrição  
- As estrelas são controladas via parâmetro (`0` a `5`)  
- Usa `Icons.star` e `Icons.star_border` para representar o ranking  
- Layout organizado com título à esquerda, estrelas à direita e descrição abaixo  

```dart
CustomCard(
  titulo: 'Curso Flutter',
  descricao: 'Aprenda Flutter com boas práticas.',
  estrelas: 4,
)
```

## 💡 Temas

- O app aplica o tema claro ou escuro dinamicamente.
- Controlado por ThemePrvider usando ChangeNotifierProvider.
- Alteração de tema em tempo real via botão com ícone na AppBar.

## 📸 Exemplos Visuais (screenshots)

### 🚀 Splash Screen
<p align="center">
  <img src="https://github.com/user-attachments/assets/6b4f2819-f36e-4927-b839-7114f7bdee7e" alt="Splash Screen" width="300"/>
</p>

---

### 📋 Onboarding
<p align="center">
  <img src="https://github.com/user-attachments/assets/4201fd7e-b6e6-4db1-b9d1-ed9ec4792a72" alt="Onboarding" width="300"/>
</p>

---

### 🔐 Login Screen
<p align="center">
  <img src="https://github.com/user-attachments/assets/2aa194f9-acdd-4371-aa77-a3e01e64d713" alt="Login Screen" width="300"/>
</p>

---

### 🌞 Light Mode
<p align="center">
  <img src="https://github.com/user-attachments/assets/7fe8e643-e8c0-4b18-8ee7-52e050fc8626" alt="Light Mode" width="300"/>
</p>

---

### 🌙 Dark Mode
<p align="center">
  <img src="https://github.com/user-attachments/assets/20813ee0-4696-4b42-8cae-5e779dd37654" alt="Dark Mode" width="300"/>
</p>

---

## 🛠️ Configuração do flutter_native_splash

```
 flutter_native_splash:
  color: "#ffffff"
  image: assets/images/logo.png
  android: true
  ios: true
```

Gere com:

```
flutter pub run flutter_native_splash:create
```

## 👨‍💻 Desenvolvido por

- João Otávio Bazzo Zimermann
- Felipe Morais
- Gabriel Vieira Moreno
