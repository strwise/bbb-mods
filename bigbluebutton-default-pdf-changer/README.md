# BigBlueButton Mods

This project contains a serie of scripts to automate modification and personalization of BigBlueButtons servers.

## BigBlueButton Default PDF Changer

This project contains a bash script that allows you to change the default PDF document used by a BigBlueButton server. The script should be executed directly on the server.

## Prerequisites

- The script should be executed as the root user.
- The server should be running BigBlueButton services.

## Usage

1. Download bash script directly on BBB server
2. When prompted, enter the path to the new PDF document. This can be either a local file path or a valid remote link.
3. The script will verify if the document is a PDF and replace the default PDF used by BigBlueButton with the new document.

Note: The script will always replace the document's name with the default name used by BigBlueButton.

## Example

Here's an example of how to use the script:

```bash
./src/change_default_pdf.sh

Enter the path to the new PDF document: /path/to/new/document.pdf

Replacing the default PDF document with /path/to/new/document.pdf...
Document successfully replaced.
```

Please ensure that you have the necessary permissions and meet the prerequisites before executing the script.

This project is licensed under the [MIT License](LICENSE).