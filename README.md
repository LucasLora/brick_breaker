# Brick Breaker — Projeto Integrador VI-A



## 📌 Sobre o projeto

**Brick Breaker** é uma implementação do clássico *Brick Breaker* (Breakout) desenvolvida como atividade do **Projeto Integrador VI-A**. O aplicativo foi desenvolvido com foco em **dispositivos Android**, oferecendo uma experiência mobile interativa, com atenção à jogabilidade, efeitos sonoros e feedback tátil.

### Objetivos principais

- Projetar, prototipar e implementar o jogo para Android;
- Implementar ao menos **3 fases**, cada uma com níveis de dificuldade e layouts diferentes;
- Tela com os **integrantes do grupo**;
- **Feedback tátil** (vibração) em momentos específicos do jogo;
- **Efeitos sonoros** ao concluir fases;
- **Interface adaptada** para mobile / Android.

---

## 🎮 Gameplay — tipos de nível

O jogo apresenta três tipos de níveis de blocos:

1. **Nível 1 — Fixo**

   - Layout pré-definido, ideal para introduzir as mecânicas básicas do jogo.

2. **Nível 2 — Semi-aleatório**

   - Parte superior do layout fixa e parte inferior gerada aleatoriamente, adicionando variedade sem perder equilíbrio.

3. **Nível 3 — Totalmente aleatório**

   - Todos os blocos gerados aleatoriamente — maior desafio e rejogabilidade.

Cada nível é representado por uma **matriz bidimensional** em que cada elemento contém informações sobre a visibilidade e as configurações do bloco.

---

## 🛠 Tecnologias e pacotes

- **Dart** — Linguagem de programação. [https://dart.dev](https://dart.dev)
- **Flutter** — Framework para UI multiplataforma (foco Android). [https://flutter.dev](https://flutter.dev)

Pacotes principais usados (disponíveis em pub.dev):

- `google_fonts` — Google Fonts para interface. [https://pub.dev/packages/google\_fonts](https://pub.dev/packages/google_fonts)
- `provider` — Gerenciamento de estado. [https://pub.dev/packages/provider](https://pub.dev/packages/provider)
- `flame` — Motor de jogo 2D. [https://pub.dev/packages/flame](https://pub.dev/packages/flame)
- `flame_forge2d` — Física (colisões, etc.) para Flame. [https://pub.dev/packages/flame\_forge2d](https://pub.dev/packages/flame_forge2d)
- `flame_audio` — Reproduzir efeitos sonoros e trilha. [https://pub.dev/packages/flame\_audio](https://pub.dev/packages/flame_audio)
- `vibration` — Controlar a vibração do dispositivo. [https://pub.dev/packages/vibration](https://pub.dev/packages/vibration)

> Observação: verifique `pubspec.yaml` para dependências exatas e versões.

---

## 🚀 Como rodar localmente

### Pré-requisitos

- Flutter SDK — **3.32.8 (stable)**
- Dart — **3.8.1**
- Android SDK / Emulador ou dispositivo físico com depuração ativada
- Git

### Passos

```bash
# Clonar o repositório
git clone https://github.com/LucasLora/brick_breaker.git
cd brick_breaker

# Instalar dependências
flutter pub get

# Rodar no dispositivo/emulador
flutter run
```
