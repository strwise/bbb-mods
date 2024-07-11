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
   git clone https://github.com/your-username/bigbluebutton-default-pdf-changer.git
   ```

2. Navigate to the project directory:

   ```bash
   cd bigbluebutton-default-pdf-changer
   ```

3. Execute the script:

   ```bash
   ./src/change_default_pdf.sh
   ```

4. When prompted, enter the path to the new PDF document. This can be either a local file path or a valid remote link.

5. The script will verify if the document is a PDF and replace the default PDF used by BigBlueButton with the new document.

Note: The script will always replace the document's name with the default name used by BigBlueButton.

### Option 2

Execute the script directly:

```bash

curl https://github.com/strwise/bbb-mods/blob/main/bigbluebutton-default-pdf-changer/src/change_default_pdf.sh | bash

```

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