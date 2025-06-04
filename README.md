# Projeto Vistorias CBMSC

Aplicativo para gerenciamento de vistorias do Corpo de Bombeiros Militar de Santa Catarina (CBMSC), seguindo os princípios de Domain-Driven Design (DDD) e Clean Architecture.

## Estrutura do Projeto

O projeto segue uma arquitetura modular baseada em DDD e Clean Architecture.

### Camadas da Arquitetura

1. **Domain**: Contém as entidades e regras de negócio centrais

   - `entities`: Modelos de domínio (Vistoria)
   - `repositories`: Interfaces que definem contratos para acesso a dados

2. **Application**: Orquestra os casos de uso da aplicação

   - `usecases`: Implementa a lógica de negócio específica (GetVistoriasUseCase)

3. **Infrastructure**: Implementa o acesso a dados

   - `dtos`: Objetos de transferência de dados para conversão entre formatos externos e internos
   - `repositories`: Implementações concretas das interfaces de repositório

4. **Presentation**: Interface do usuário
   - `screens`: Telas principais da aplicação
   - `widgets`: Componentes reutilizáveis (cards, filtros)
   - `dialogs`: Popups e modais
   - `providers`: Gerenciamento de estado com Riverpod

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento multiplataforma
- **Riverpod**: Gerenciamento de estado e injeção de dependência
- **Drift** (recomendado): Banco de dados local SQL com segurança de tipo

## Como Executar

1. Certifique-se de ter o Flutter instalado (versão 3.0.0 ou superior)
2. Clone este repositório
3. Execute `flutter pub get` para instalar as dependências
4. Execute `flutter run` para iniciar o aplicativo

## Fluxo de Funcionamento

1. O usuário abre o aplicativo, que inicializa o ProviderScope e carrega a VistoriasScreen
2. A VistoriasScreen observa o estado vistoriasProvider
3. O vistoriaProvider chama o GetVistoriasUseCase
4. O GetVistoriasUseCase chama VistoriasRepository.getVistorias()
5. A implementação VistoriasRepositoryImpl busca os dados e converte para entidades
6. Os dados retornam pelo mesmo caminho até a UI
7. A VistoriasScreen exibe os cards com os dados das vistorias
