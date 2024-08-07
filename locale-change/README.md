# BigBlueButton Locale Change

Este projeto contém um script bash que permite alterar o locale padrão usado pelo servidor BigBlueButton para um valor definido pelo usuário.

## Uso

### Opção 1

1. Clone o repositório:

   ```bash
   git clone https://github.com/strwise/bbb-mods.git
   ```

2. Navegue até o diretório `locale-change`:

   ```bash
   cd locale-change
   ```

3. Torne o script executável:

   ```bash
   chmod +x src/run.sh
   ```

4. Execute o script:

   ```bash
   ./src/run.sh
   ```

5. Quando solicitado, insira o locale desejado (por exemplo, en_US, pt_BR).

### Opção 2

Execute o script diretamente:

```bash
curl https://raw.githubusercontent.com/strwise/bbb-mods/main/locale-change/src/run.sh | bash
```

## Exemplo

Aqui está um exemplo de como usar o script:

```bash
curl https://raw.githubusercontent.com/strwise/bbb-mods/main/locale-change/src/run.sh | bash

Enter the desired locale (e.g., en_US, pt_BR): pt_BR

The default locale for BigBlueButton has been set to pt_BR.
```

Por favor, certifique-se de que você tem as permissões necessárias e atende aos pré-requisitos antes de executar o script.

## Contribuindo

Contribuições são bem-vindas! Se você tiver sugestões, melhorias ou correções de bugs, sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Licença

Este projeto é licenciado sob a [Licença MIT](LICENSE).