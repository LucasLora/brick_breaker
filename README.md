# Brick Breaker — Projeto Integrador VI-A

## 📌 Sobre o projeto

**Brick Breaker** é uma recriação do clássico _Breakout_ desenvolvida como parte do Projeto **Integrador VI-A**. O app foi feito com foco em **dispositivos Android**, utilizando Flutter e Flame para entregar uma experiência divertida, responsiva e interativa.

### Objetivos do Projeto
- Prototipar o jogo para Android;
- Criar tela com os integrantes do grupo;
- Criar tela de configurações (áudio, vibração e dificuldade);
- Implementar **3 fases diferentes**, cada uma com layouts únicos;
- Ajustar a dificuldade das fases mudando a **velocidade da bola**;
- Adicionar **efeitos sonoros** ao quebrar blocos e concluir fases;
- Adicionar **feedback tátil** (vibração) ao ganhar ou perder fases.

---

## 🔮 Próximos Passos
- Implementar sistema de vidas (já existe trecho comentado no AppBar);
- Adicionar pause/resume da partida (já existe trecho comentado no AppBar);
- Criar sistema de pontuação (score por bloco destruído, bônus, etc.);
- Desenvolver uma splash screen de abertura;

---

## 🎮 Gameplay — tipos de nível
O jogo conta com três estilos de níveis:
1. **Nível 1 — Fixo**
   - Layout pré-definido, ideal para aprender as mecânicas.
2. **Nível 2 — Semi-aleatório**
   - Parte superior fixa e parte inferior gerada aleatoriamente, equilibrando desafio e variedade.
3. **Nível 3 — Totalmente aleatório**
   - Todos os blocos gerados aleatoriamente, maior desafio e rejogabilidade.

---

## 🛠 Tecnologias e Pacotes
- **Dart** — Linguagem de programação. [https://dart.dev](https://dart.dev)
- **Flutter** — Framework multiplataforma. [https://flutter.dev](https://flutter.dev)

Pacotes principais usados (disponíveis em pub.dev):
- `provider` — Gerenciamento de estado. [https://pub.dev/packages/provider](https://pub.dev/packages/provider)
- `google_fonts` — Fontes customizadas. [https://pub.dev/packages/google\_fonts](https://pub.dev/packages/google_fonts)
- `shared_preferences` — Persistência de dados. [https://pub.dev/packages/shared_preferences](https://pub.dev/packages/shared_preferences)
- `flame` — Motor de jogo 2D. [https://pub.dev/packages/flame](https://pub.dev/packages/flame)
- `flame_forge2d` — Física e colisões. [https://pub.dev/packages/flame\_forge2d](https://pub.dev/packages/flame_forge2d)
- `flame_audio` — Efeitos sonoros. [https://pub.dev/packages/flame\_audio](https://pub.dev/packages/flame_audio)
- `vibration` — Vibração do dispositivo. [https://pub.dev/packages/vibration](https://pub.dev/packages/vibration)

> Observação: verifique `pubspec.yaml` para dependências exatas e versões.

---

## 🚀 Como rodar localmente
### Pré-requisitos

- Flutter SDK — **3.32.8 (stable)**
- Dart — **3.8.1**
- Emulador ou dispositivo físico com depuração ativada
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
