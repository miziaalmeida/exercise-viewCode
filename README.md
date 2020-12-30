# exercise-viewCode

**O que deve ser desenvolvido:**

* Tela de listagem de produtos:
* Fazer a chamada na API https://private-8f4dda-testeabi.apiary-mock.com/produtos (GET)
* Criar uma lista com a resposta da API
* Validar se o campo desconto == true e colocar o campo preço em verde
* Ao clicar célula de produto, devemos navegar para uma Tela de Detalhes do Pedido, contendo o título do produto e outras informações a seu critério.
* O desenvolvimento das telas deverá ser feito utilizando Auto Layout, ou seja, a tela deverá continuar funcionando tanto para portrait quanto landscape.

**Bonus:**

* Desnvolvimento de componentes visuais usando View Code. (Guide: https://www.raywenderlich.com/6004856-building-an-app-with-only-code-using-auto-layout)
* Animação de transição - Imagem da célula, titulo do produto na tela de Descrição, etc. Fique a vontade para criar suas animações.
* Activity Indicator na tela dos produtos. É uma boa prática mostrarmos que estamos fazendo requisições para o usuário, e neste challenge, podemos utilizar o UIActivityIndicator!
* Caso a requisição retorne um erro, mostrar um botão no centro da tela com a opção para o usuário tentar novamente
* Fique a vontade na Tela de Detalhes do Pedido para adicionar as outras informações do produto, como imagem, descrição, preço.
