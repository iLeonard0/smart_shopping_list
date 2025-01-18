# Smart Shopping List

O **Smart Shopping List** é um aplicativo para gerenciar sua lista de compras de forma simples e eficiente. Com funcionalidades inteligentes, o app permite adicionar, remover, e marcar itens como comprados, além de sugerir produtos com base em uma integração com uma API externa. O app também permite alternar entre os modos claro e escuro.

## Funcionalidades

### 1. **Gerenciamento de Lista de Compras**
   - **Adicionar itens**: O usuário pode adicionar itens manualmente à lista de compras.
   - **Remover itens**: Permite remover itens da lista de compras a qualquer momento.
   - **Marcar itens como comprados**: O app possibilita marcar um item como comprado, riscando o nome dele na lista.
   
### 2. **Integração com API de Produtos**
   - **Buscar produtos**: O aplicativo busca produtos de uma API externa (https://dummyjson.com) e exibe sugestões de produtos para a lista de compras.
   - **Adicionar produtos sugeridos**: O usuário pode adicionar produtos sugeridos à sua lista de compras diretamente da interface.

### 3. **Alternância de Tema**
   - **Modo Claro e Escuro**: O aplicativo permite ao usuário alternar entre o modo claro e o modo escuro, melhorando a experiência de uso conforme a preferência pessoal.

## Tecnologias Utilizadas

- **Flutter**: Framework utilizado para o desenvolvimento do app, garantindo desempenho e uma interface nativa em diferentes plataformas.
- **Provider**: Gerenciamento de estado utilizado para controlar o estado global do app.
- **Dio e Retrofit**: Utilizados para integrar com a API externa e realizar chamadas HTTP para buscar produtos.

## Como Funciona

1. **Tela Inicial (HomeScreen)**: Na tela inicial, o usuário pode ver o título do app e tem acesso ao menu para alternar entre os modos claro e escuro. Ao tocar no título "SmartShopper", o usuário é redirecionado para a tela de produtos.
  
2. **Tela de Lista de Produtos (ProductListScreen)**: Nesta tela, o usuário pode visualizar e interagir com os itens na lista de compras. Pode adicionar itens manualmente ou escolher produtos sugeridos pela API. Cada item da lista pode ser marcado como comprado ou removido da lista.

3. **Adicionar Itens**: Para adicionar um item, basta clicar no ícone de adicionar na tela de lista de compras e inserir o nome do item desejado.

4. **Produtos Sugeridos**: O app oferece sugestões de produtos ao usuário, que pode adicioná-los à lista de compras.

## Como Usar

1. Baixe o app.
2. Na tela inicial, toque no título para acessar a tela de produtos.
3. Na tela de produtos, você pode adicionar itens à sua lista manualmente ou escolher produtos sugeridos.
4. Use o ícone de alternância de tema para mudar entre o modo claro e escuro.
5. Gerencie sua lista de compras, marcando os itens como comprados ou removendo-os.

## Contribuições

Contribuições são bem-vindas! Para sugerir melhorias ou corrigir erros, envie um **Pull Request**.
