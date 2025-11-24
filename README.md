![Banner](Media.xcassets/capa.imageset/capa.png)

> *"Às vezes, os desvios da vida podem nos levar a destinos inesperados e emocionantes."*

## Sobre o Projeto

**Amandinha no Mundo Tech** é uma experiência interativa desenvolvida em **Swift** utilizando o framework **SpriteKit**. O projeto conta a história da descoberta profissional de uma amiga, ambientada na cidade de Manaus.

O app combina storytelling visual com mecânicas de "Point and Click" para guiar o usuário através dos capítulos da vida de Amandinha, desde o sonho da medicina até a descoberta do mundo da programação.

## A História

A narrativa é dividida em cenas interativas que abordam:

1.  **Sonho:** Amandinha, uma menina de luz forte em Manaus, sonha em curar as dores das pessoas através da medicina.
2.  **Obstáculo:** Um acidente na escola a leva ao hospital, onde ela descobre um medo paralisante de sangue, colocando seu futuro em cheque.
3.  **Escuridão:** A frustração de ver seu sonho desmoronar torna o mundo de Amandinha cinza.
4.  **Centelha:** Lucas, seu irmão, a apresenta ao mundo da tecnologia. Ao digitar seu primeiro "Hello World", a cor volta à sua vida.
5.  **Transformação:** Amandinha descobre que pode transformar vidas e ajudar o próximo não apenas com estetoscópios, mas com linhas de código.

## Como Jogar / Funcionalidades

O projeto foi construído como um **Swift Playgrounds App**.

* **Navegação por Toque:** Toque na tela para mover a personagem Amandinha pelo cenário.
* **Interação com Objetos:** Toque em quadros, botões e personagens (como o Doutor, o Amigo e o Lucas) para avançar a história.
* **Animações:** Sprites personalizados para caminhar, chorar e programar.
* **Física (SKPhysicsBody):** Detecção de colisão para ativar eventos narrativos e transições de cena.

## Tecnologias Utilizadas

* **Linguagem:** [Swift 5.8](https://developer.apple.com/swift/)
* **Framework Gráfico:** [SpriteKit](https://developer.apple.com/spritekit/) (para cenas, física e animações 2D)
* **Interface:** [SwiftUI](https://developer.apple.com/xcode/swiftui/) (para a `ContentView` e gerenciamento da `SpriteView`)
* **Assets:** Arte original em Pixel Art.

## Estrutura do Projeto

* `ContentView.swift`: Ponto de entrada do app que renderiza a `SpriteView`.
* `Cenas/`: Contém a lógica de cada capítulo da história (Cena0 a Cena5).
* `Entity/`: Classes que definem os comportamentos dos personagens (Amandinha, Lucas, Doctor, Personagem genérico).
* `Media.xcassets`: Repositório de todas as sprites e texturas (animações de caminhada, choro, cenários).

## Como Rodar o Projeto

### Requisitos
* Mac com Xcode 14+ ou iPad com Swift Playgrounds 4+.
* iOS 16.0+

### Passos
1.  Clone este repositório:
    ```bash
    git clone [https://github.com/seu-usuario/amandinha-no-mundo-tech.git](https://github.com/seu-usuario/amandinha-no-mundo-tech.git)
    ```
2.  Abra o arquivo `.swiftpm` (ou o pacote) no **Xcode** ou **Swift Playgrounds**.
3.  Selecione o simulador desejado (iPhone ou iPad).
4.  Pressione **Run (cmd + R)**.

## Créditos

* **Desenvolvimento:** Thales Araújo
* **Arte:** Thales Araújo (Pixel Art via Xcode Assets)
* **Inspiração:** A história real de Amandinha.
