# BigBlueButton Mods

This project contains a serie of scripts to automate modification and personalization of BigBlueButtons servers.

## BigBlueButton Default PDF Changer

This project contains a bash script that allows you to change the default PDF document used by a BigBlueButton server. The script should be executed directly on the server.

## Prerequisites

- The script should be executed as the root user.
- The server should be running BigBlueButton services.

## Usage

### Option 1

1. Clone this repository to your server:

   ```bash
   git clone https://github.com/strwise/bbb-mods.git
   ```

2. Navigate to the project directory:

   ```bash
   cd presenter-change
   ```

3. Execute the script:

   ```bash
   ./src/run.sh
   ```

4. When prompted, enter the path to the new PDF document. This can be either a **local file path or a valid remote link**.

5. The script will verify if the document is a PDF and replace the default PDF used by BigBlueButton with the new document.

Note: The script will always replace the document's name with the default name used by BigBlueButton.

### Option 2

Execute the script directly:

```bash

curl -fsSL https://raw.githubusercontent.com/strwise/bbb-mods/main/presenter-change/src/run.sh -o bbb-presenter-change.sh

```

```bash

bash bbb-presenter-change.sh -p <PDF_PATH>

```

## Example

Here's an example of how to use the script:

```bash

$ curl -fsSL https://raw.githubusercontent.com/strwise/bbb-mods/main/presenter-change/src/run.sh -o bbb-presenter-change.sh

$ bash bbb-presenter-change.sh -p https://s3.example.com/presenter.pdf

$ Replacing the default PDF document with /path/to/new/document.pdf...

$ Document successfully replaced.

```

Please ensure that you have the necessary permissions and meet the prerequisites before executing the script.

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
```